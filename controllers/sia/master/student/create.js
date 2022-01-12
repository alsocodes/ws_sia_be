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
            nis, nisn, nik, no_akta,
            name, gender, place_birth, day_birth,
            religion, address, rt, rw, urban, sub_district, city, postal_code,
            email, phone, entry_year,
            father_name, mother_name, father_job, mother_job,
            father_education, mother_education, father_email, mother_email,
            father_phone, mother_phone,
            guardian_name
        } = req.body

        let check = await db.student.findOne({ where: { [Op.and]: [{ nis: nis }] } })
        if (check) return response.invalidInput('NIS sudah ada', res)

        check = await db.student.findOne({ where: { [Op.and]: [{ nisn: nisn }] } })
        if (check) return response.invalidInput('NISN sudah ada', res)

        if (email !== '') {
            check = await db.student.findOne({ where: { [Op.and]: [{ email: email }] } })
            if (check) return response.invalidInput('Email sudah ada', res)
        }

        const user = await db.user.create({
            name: name,
            email: email,
            nisn: nisn,
            password: await bcrypt.hash(day_birth, 10),
            role_id: 2,
            user_type: 'student'
        }, { transaction: t })

        const student = await db.student.create({
            user_id: user.id,
            nis: nis,
            nisn: nisn,
            nik: nik,
            no_akta: no_akta,
            name: name,
            gender: gender,
            place_birth: place_birth,
            day_birth: day_birth,
            religion: religion,
            address: address,
            rt: rt,
            rw: rw,
            urban: urban,
            sub_district: sub_district,
            city: city,
            postal_code: postal_code,
            email: email,
            phone: phone,
            entry_year: entry_year,
            father_name: father_name,
            mother_name: mother_name,
            father_job: father_job,
            mother_job: mother_job,
            father_education: father_education,
            mother_education: mother_education,
            father_email: father_email,
            mother_email: mother_email,
            father_phone: father_phone,
            mother_phone: mother_phone,
            guardian_name: guardian_name
        }, { transaction: t })

        t.commit();
        return response.success("Menambahkan siswa berhasil", res, { id: student.id }, 201);
    } catch (err) {
        console.log(err);
        t.rollback();
        return response.error(err.message || "Gagal menambahkan siswa", res);
    }
};
