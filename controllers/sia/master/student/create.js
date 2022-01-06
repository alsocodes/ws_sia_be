const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");
const bcrypt = require('bcrypt');

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const {
            nis, nisn,
            name, gender, place_birth, day_birth,
            religion, address, email, entry_year, out_year, out_reason,
            child_no, father_name, mother_name, father_job, mother_job,
            father_education, mother_education, father_address,
            mother_address, father_email, mother_email, father_phone, mother_phone,
            guardian_name, guardian_address, guardian_phone, guardian_relation
        } = req.body

        let check = await db.student.findOne({ where: { [Op.and]: [{ nis: nis }] } })
        if (check) return response.invalidInput('NIS sudah ada', res)

        check = await db.student.findOne({ where: { [Op.and]: [{ nisn: nisn }] } })
        if (check) return response.invalidInput('NISN sudah ada', res)

        check = await db.student.findOne({ where: { [Op.and]: [{ email: email }] } })
        if (check) return response.invalidInput('Email sudah ada', res)

        const user = await db.user.create({
            name: name,
            email: email,
            password: await bcrypt.hash('123456', 10),
            role_id: 2,
            user_type: 'student'
        }, { transaction: t })

        const student = await db.student.create({
            user_id: user.id,
            nis: nis,
            nisn: nisn,
            name: name,
            gender: gender,
            place_birth: place_birth,
            day_birth: day_birth,
            religion: religion,
            address: address,
            email: email,
            entry_year: entry_year,
            out_year: out_year,
            out_reason: out_reason,
            child_no: child_no,
            father_name: father_name,
            mother_name: mother_name,
            father_job: father_job,
            mother_job: mother_job,
            father_education: father_education,
            mother_education: mother_education,
            father_address: father_address,
            mother_address: mother_address,
            father_email: father_email,
            mother_email: mother_email,
            father_phone: father_phone,
            mother_phone: mother_phone,
            guardian_name: guardian_name,
            guardian_address: guardian_address,
            guardian_phone: guardian_phone,
            guardian_relation: guardian_relation
        },
            { transaction: t })

        t.commit();
        return response.success("Menambahkan siswa berhasil", res, { id: student.id }, 201);
    } catch (err) {
        console.log(err);
        t.rollback();
        return response.error(err.message || "Gagal menambahkan siswa", res);
    }
};
