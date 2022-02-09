const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getClassYear = async (req, res) => {
    try {

        const {
            lesson_class_id
        } = req.query

        if (!lesson_class_id) {
            const error = new Error("Pelajaran per kelas harus dipilih");
            error.code = 400;
            throw error
        }

        const lesson_class_student = await db.lesson_class_student.findAll({
            attributes: [
                'id', 'status', 'created_at', 'passed_by', 'passed_at'
            ],
            include: [
                {
                    model: db.student,
                    attributes: ['id', 'nisn', 'nis', 'name']
                },

            ],
            where: {
                [Op.and]: [{ lesson_class_id: lesson_class_id }, { status: 'active' }],
            },
            raw: true
        })

        const lesson_class = await db.lesson_class.findOne({ where: { id: lesson_class_id } })
        const calons = await db.student_class.findAll({
            attributes: ['id', 'status', 'classroom_id', 'eduyear_id'],
            raw: true,
            include: {
                required: true,
                as: 'student',
                model: db.student,
                attributes: ['id', 'nisn', 'nis', 'name']
            },
            where: {
                status: 'active',
                classroom_id: lesson_class.classroom_id,
                eduyear_id: lesson_class.eduyear_id
            }
        })

        return response.success("Get sukses", res, { calon_peserta: calons, peserta: lesson_class_student, lesson_class }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res, err.code);
    }
};
