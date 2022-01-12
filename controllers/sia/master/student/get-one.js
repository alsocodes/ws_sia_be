const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {

        const { id } = req.params

        const student = await db.student.findOne({
            attributes: [
                'id', 'user_id', 'nis', 'nisn', 'nik', 'no_akta',
                'name', 'gender', 'place_birth', 'day_birth',
                'religion', 'address', 'email', 'phone', 'rt', 'rw', 'urban', 'sub_district', 'city', 'postal_code',
                'father_name', 'father_job', 'father_education', 'father_email', 'father_phone',
                'mother_name', 'mother_job', 'mother_education', 'mother_email', 'mother_phone',
                'guardian_name',
                'entry_year', 'out_year', 'out_reason',
                'created_at'
            ],
            include: {
                required: false,
                as: 'active_class',
                model: db.student_class,
                attributes: ['id', 'status'],
                where: { status: 'active' },
                include: {
                    model: db.classroom,
                    attributes: ['id', 'code', 'room', 'name'],
                }
            },
            where: { id: id },
        })

        return response.success("Get siswa sukses ", res, student, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
