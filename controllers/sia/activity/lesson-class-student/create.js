const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        /**
         * Aturan:
         * Satu siswa hanya boleh mengikuti satu mata pelajaran kelas id
         * Siswa harus benar dari kelas dan tahun ajaran sesuai dengan lesson_class
         */
        const {
            lesson_class_id,
            students
        } = req.body
        const user = req.user
        let result = {}
        await Promise.all(students.map(async (item) => {
            const { id, student_id, is_delete } = item;
            const student = await db.student.findOne({ where: { id: student_id } })
            if (!id) {
                if (is_delete !== true) {
                    let check = await db.lesson_class_student.findOne({
                        where: { [Op.and]: [{ lesson_class_id: lesson_class_id }, { student_id: student_id }] }
                    })
                    if (check) {
                        const error = new Error(`${student.name} sudah mengikuti kelas pelajaran ini`)
                        error.code = 400
                        throw error
                    }
                    await db.lesson_class_student.create({
                        lesson_class_id: lesson_class_id,
                        student_id: student_id,
                        created_by: user.id,
                        updated_by: user.id
                    }, { transaction: t })
                }
            } else {
                const lesson_class_student = await db.lesson_class_student.findOne({ where: { id: id } })
                if (lesson_class_student && is_delete === true) await lesson_class_student.destroy({ transaction: t })
            }
        }))

        await t.commit()

        return response.success("Menambhkan pelajaran siswa berhasil", res, result, 201);
    } catch (err) {
        await t.rollback()
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
