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
            student_id
        } = req.body

        const user = await db.user.findOne({ where: { id: req.user.id } })

        // let where1 = {}
        // let where2 = {}
        // let where3 = {}
        // if (user.user_type === 'administrator') {
        //     where1 = {
        //         eduyear_id: eduyear_id,
        //         classroom_id: classroom_id,
        //     }
        // }

        // if (user.user_type === 'student') {
        //     const student = await db.student.findOne({ where: { user_id: user.id } })
        //     where3 = {
        //         id: student.id
        //     }
        // }

        let where_classroom = {
            code: 'IX'
        }
        if (classroom_id) {
            where_classroom['id'] = classroom_id
        }

        let where_student_class = {
            status: 'passed'
        }
        if (eduyear_id) {
            where_student_class['eduyear_id'] = eduyear_id
        }

        let where_student = {}
        if (student_id) {
            where_student['id'] = student_id
        }

        const graduation = await db.student.findAll({
            attributes: ['id', 'name', 'nisn', 'nis'],
            include: [
                {
                    model: db.student_class,
                    where: where_student_class,
                    include: {
                        model: db.classroom,
                        attributes: ['id', 'code', 'name'],
                        where: where_classroom
                    },
                },
                {
                    model: db.graduation,
                    attributes: [
                        'id',
                        'file',
                        [Sequelize.fn('concat', helper.attachmentUrl, Sequelize.col('file')), 'file_url'],
                        'final_score', 'created_at'
                    ]
                }
            ],
            where: where_student

        })

        return response.success("Success", res, graduation, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
