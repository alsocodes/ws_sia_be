const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { user } = req
        const { id } = req.params
        const teacher_class_lesson = await db.lesson_class.findOne({
            attributes: [
                'id', 'status', 'created_at', 'passed_by', 'passed_at'
            ],
            include: [
                {
                    model: db.classroom,
                    attributes: ['id', 'code', 'room', 'name']
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
                    model: db.lesson,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.teacher,
                    attributes: ['id', 'nip', 'name']
                },
            ],
            where: {
                id: id,
            },
        })

        return response.success("Get kelas pelajaran guru sukses", res, teacher_class_lesson, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get kelas pelajaran guru", res);
    }
};
