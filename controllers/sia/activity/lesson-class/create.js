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
            lesson_teachers,
            add_all_student
        } = req.body

        const user = req.user
        let result = {}
        let check = await db.semester.findOne({ where: { id: semester_id } })
        if (check?.status === 'inactive') return response.invalidInput("Tidak bisa menambahkan pelajaran pada semester yang tidak aktif", res)

        let students = []
        if (add_all_student) {
            students = await db.student_class.findAll({
                attibutes: ['student_id'],
                where: {
                    classroom_id: classroom_id,
                    eduyear_id: eduyear_id,
                    status: 'active'
                }
            })
        }

        await Promise.all(lesson_teachers.map(async (item, key) => {
            // lesson, class, eduyear, semester hanya boleh ada satu
            let lesson_class_id = 0;
            let is_delete_lesson_class = false
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
                lesson_class_id = lesson_class.id
            } else {
                const lesson_class = await db.lesson_class.findOne({ where: { id: item.id } })
                if (item.is_delete) {
                    await lesson_class.destroy({ transaction: t })
                    is_delete_lesson_class = true
                }
                lesson_class_id = lesson_class.id
            }

            if (add_all_student) {
                await Promise.all(students.map(async (student) => {
                    const { student_id } = student
                    const check_student = await db.lesson_class_student.findOne({
                        where: {
                            lesson_class_id: lesson_class_id,
                            student_id: student_id,
                            status: 'active'
                        }
                    })
                    if (check_student) {
                        if (is_delete_lesson_class) await db.lesson_class_student.destroy({ transaction: t })
                    } else {
                        if (!is_delete_lesson_class) await db.lesson_class_student.create({
                            lesson_class_id: lesson_class_id,
                            student_id: student_id,
                            created_by: user.id,
                            updated_by: user.id,
                        }, { transaction: t })
                    }
                }))
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
