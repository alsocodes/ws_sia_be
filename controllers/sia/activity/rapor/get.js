const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {

        const {
            eduyear_id,
            classroom_id,
            semester_id
        } = req.body

        const user = await db.user.findOne({ where: { id: req.user.id } })

        let where1 = {}
        let where2 = {}
        let where3 = {}
        if (user.user_type === 'administrator') {
            where1 = {
                eduyear_id: eduyear_id,
                classroom_id: classroom_id,
            }
            where2 = {
                semester_id: semester_id
            }
        }

        if (user.user_type === 'student') {
            const student = await db.student.findOne({ where: { user_id: user.id } })
            where3 = {
                id: student.id
            }
        }

        const rapors = await db.student_class.findAll({
            raw: true,
            attributes: ['id', 'status', 'passed_at', 'passed_by'],
            include: [
                {
                    model: db.classroom,
                    attributes: ['code', 'name'],
                },
                {
                    model: db.eduyear,
                    attributes: ['code', 'name'],
                },
                {
                    as: 'student',
                    model: db.student,
                    attributes: ['id', 'nis', 'nisn', 'name'],
                    where: where3
                },
                {
                    required: false,
                    model: db.student_class_rapor,
                    attributes: [
                        'id',
                        [Sequelize.fn('IFNULL', Sequelize.col('semester_id'), semester_id), 'semester_id'],
                        'file',
                        [Sequelize.fn('concat', helper.attachmentUrl, Sequelize.col('file')), 'file_url'],
                    ],
                    where: where2
                },
            ],
            where: where1
        })

        return response.success("Success", res, rapors, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
