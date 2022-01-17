const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {
        const { id } = req.params
        const lesson_class_student = await db.lesson_class_student.findOne({
            attributes: [
                'id', 'status', 'created_at', 'passed_by', 'passed_at'
            ],
            include: [
                {
                    model: db.student,
                    attributes: ['id', 'nisn', 'nis', 'name']
                },
                {
                    model: db.lesson_class,
                    attributes: ['id', 'status'],
                    include: [
                        {
                            model: db.classroom,
                            attributes: ['id', 'code', 'room', 'name']
                        },
                        {
                            model: db.lesson,
                            attributes: ['id', 'code', 'name']
                        },
                        {
                            model: db.eduyear,
                            attributes: ['id', 'code', 'name']
                        },
                        {
                            model: db.semester,
                            attributes: ['id', 'code', 'name']
                        },
                        {
                            model: db.teacher,
                            attributes: ['id', 'nip', 'name']
                        }
                    ]
                }

            ],
            // raw: true,
            where: {
                id: id
            },
        })

        return response.success("Get pembelajaran siswa sukses", res, lesson_class_student, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get pembelajaran siswa", res);
    }
};
