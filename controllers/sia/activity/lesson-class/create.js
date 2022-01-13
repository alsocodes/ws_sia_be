const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const {
            classroom_id,
            eduyear_id,
            semester_id,
            lesson_teachers
        } = req.body

        const user = req.user
        let result = {}
        let check = await db.semester.findOne({ where: { id: semester_id } })
        if (check?.status === 'inactive') return response.invalidInput("Tidak bisa menambahkan pelajaran pada semester yang tidak aktif", res)

        await Promise.all(lesson_teachers.map(async (item, key) => {
            // lesson, class, eduyear, semester hanya boleh ada satu

            if (parseInt(item.id) === 0) {
                check = await db.lesson_class.findOne({
                    where: {
                        [Op.and]: [
                            { lesson_id: item.lesson_id }, { classroom_id: classroom_id }, { eduyear_id: eduyear_id }, , { semester_id: semester_id }
                        ]
                    }
                })
                if (check) {
                    const error = new Error("Pelajaran sudah ditambahkan pada kelas, tahun, dan semester yang dipilih.")
                    error.code = 400
                    throw error
                }
                const lesson_class = await db.lesson_class.create({
                    classroom_id: classroom_id,
                    eduyear_id: eduyear_id,
                    semester_id: semester_id,
                    lesson_id: item.lesson_id,
                    teacher_id: item.teacher_id,
                    created_by: user.id,
                    updated_by: user.id,
                }, { transaction: t })
                if (!lesson_class) {
                    const error = new Error("Error")
                    error.code = 400
                    throw error
                }
                if (key === 0) result = { id: lesson_class.id }
            } else {
                const lesson_clas = await db.lesson_class.findOne({ where: { id: item.id } })
                if (item.is_delete) await lesson_clas.destroy({ transaction: t })
            }

        }))

        await t.commit()
        return response.success("Menambhkan pembelajaran kelas berhasil", res, result, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal menambhkan pembelajaran kelas", res);
    }
};
