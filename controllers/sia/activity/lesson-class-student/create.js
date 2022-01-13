const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    // const t = await sequelize.transaction();
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

        let check = await db.semester.findOne({ where: { id: semester_id } })
        if (check?.status === 'inactive') return response.invalidInput("Tidak bisa menambahkan pelajaran pada semester yang tidak aktif", res)

        // lesson, class, eduyear, semester hanya boleh ada satu
        check = await db.lesson_class.findOne({
            where: {
                [Op.and]: [
                    { lesson_id: lesson_id }, { classroom_id: classroom_id }, { eduyear_id: eduyear_id }, , { semester_id: semester_id }
                ]
            }
        })
        if (check) return response.invalidInput("Pelajaran sudah ditambahkan pada kelas, tahun, dan semester yang dipilih.", res)

        const lesson_class = await db.lesson_class.create({
            lesson_id: lesson_id,
            classroom_id: classroom_id,
            eduyear_id: eduyear_id,
            semester_id: semester_id,
            teacher_id: teacher_id,
            created_by: user.id,
            updated_by: user.id,
        })

        return response.success("Menambhkan pembelajaran kelas berhasil", res, {
            id: lesson_class.id
        }, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal menambhkan pembelajaran kelas", res);
    }
};
