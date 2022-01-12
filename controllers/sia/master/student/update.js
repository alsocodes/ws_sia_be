const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
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

        const { id } = req.params
        const student = await db.student.findOne({ where: { id: id } })
        if (!student) return response.invalidInput('Siswa tidak ditemukan', res)

        let check = await db.student.findOne({ where: { [Op.and]: [{ nis: nis }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('NIS sudah ada', res)

        check = await db.student.findOne({ where: { [Op.and]: [{ nisn: nisn }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('NISN sudah ada', res)

        check = await db.student.findOne({ where: { [Op.and]: [{ email: email }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Email sudah ada', res)

        student.nis = nis;
        student.nisn = nisn;
        student.nik = nik;
        student.no_akta = no_akta;
        student.name = name;
        student.gender = gender;
        student.place_birth = place_birth;
        student.day_birth = day_birth;
        student.religion = religion;
        student.address = address;
        student.rt = rt;
        student.rw = rw;
        student.urban = urban;
        student.sub_district = sub_district;
        student.city = city;
        student.postal_code = postal_code;
        student.email = email;
        student.phone = phone;
        student.entry_year = entry_year;
        student.father_name = father_name;
        student.mother_name = mother_name;
        student.father_job = father_job;
        student.mother_job = mother_job;
        student.father_education = father_education;
        student.mother_education = mother_education;
        student.father_email = father_email;
        student.mother_email = mother_email;
        student.father_phone = father_phone;
        student.mother_phone = mother_phone;
        student.guardian_name = guardian_name;
        await student.save()

        return response.success("Update Siswa berhasil", res, { id: student.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update Siswa", res);
    }
};
