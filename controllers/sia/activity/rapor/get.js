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

        const rapors = await db.student_class.findAll({
            raw: true,
            attributes: ['id', 'status', 'passed_at', 'passed_by'],
            include: [
                {
                    as: 'student',
                    model: db.student,
                    attributes: ['id', 'nis', 'nisn', 'name']
                },
                {
                    required: false,
                    model: db.student_class_rapor,
                    attributes: [
                        [Sequelize.fn('IFNULL', Sequelize.col('semester_id'), semester_id), 'semester_id'],
                        'file'
                    ],
                    where: { semester_id: semester_id }
                },
            ],
            where: {
                eduyear_id: eduyear_id,
                classroom_id: classroom_id,
            }
        })

        return response.success("Success", res, rapors, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
