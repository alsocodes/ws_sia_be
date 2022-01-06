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
                'id', 'user_id', 'nis', 'nisn',
                'name', 'gender', 'place_birth', 'day_birth',
                'religion', 'address', 'email', 'entry_year', 'out_year', 'out_reason',
                'child_no', 'father_name', 'mother_name', 'father_job', 'mother_job',
                'father_education', 'mother_education', 'father_address',
                'mother_address', 'father_email', 'mother_email', 'father_phone', 'mother_phone',
                'guardian_name', 'guardian_address', 'guardian_phone', 'guardian_relation', 'created_at'
            ],
            where: { id: id },
        })

        return response.success("Get siswa sukses ", res, student, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
