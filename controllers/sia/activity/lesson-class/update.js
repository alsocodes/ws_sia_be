const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    // const t = await sequelize.transaction();
    try {

        const {
            lesson_id,
            classroom_id,
            eduyear_id,
            semester_id,
            teacher_id
        } = req.body

        const { id } = req.params
        const user = req.user

        let check = await db.semester.findOne({ where: { id: semester_id } })
        if (check?.status === 'inactive') return response.invalidInput("Tidak bisa menambahkan pelajaran pada semester yang tidak aktif", res)

        // lesson, class, eduyear, semester hanya boleh ada satu
        check = await db.lesson_class.findOne({
            where: {
                [Op.and]: [
                    { id: { [Op.ne]: id } },
                    { lesson_id: lesson_id }, { classroom_id: classroom_id }, { eduyear_id: eduyear_id }, , { semester_id: semester_id }
                ]
            }
        })
        if (check) return response.invalidInput("Pelajaran sudah ditambahkan pada kelas, tahun, dan semester yang dipilih.", res)

        const lesson_class = await db.lesson_class.findOne({ where: { id: id } })
        if (!lesson_class) return response.invalidInput("Tidak ditemukan", res)

        lesson_class.lesson_id = lesson_id;
        lesson_class.classroom_id = classroom_id;
        lesson_class.eduyear_id = eduyear_id;
        lesson_class.semester_id = semester_id;
        lesson_class.teacher_id = teacher_id;
        await lesson_class.save()

        return response.success("Mengubah pembelajaran kelas berhasil", res, {
            id: lesson_class.id
        }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal mengubah pembelajaran kelas", res);
    }
};
