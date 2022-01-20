const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { id } = req.params
        const lesson_class_students = await db.lesson_class_student.findAll({
            attributes: [
                'id', 'status', 'created_at', 'passed_by', 'passed_at'
            ],
            include: [
                {
                    model: db.student,
                    attributes: ['id', 'nisn', 'name', 'nis']
                },
            ],
            where: {
                lesson_class_id: id,
            },
            order: [['id', 'asc']]
        })


        return response.success("Get peserta kelas sukses", res, lesson_class_students, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get peserta kelas", res);
    }
};
