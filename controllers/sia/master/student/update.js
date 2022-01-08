const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const {
            nis, nisn,
            name, gender, place_birth, day_birth,
            religion, address, email, phone, entry_year,
            child_no, father_name, mother_name, father_job, mother_job,
            father_education, mother_education, father_address,
            mother_address, father_email, mother_email, father_phone, mother_phone,
            guardian_name, guardian_address, guardian_phone, guardian_relation
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
        student.name = name;
        student.gender = gender;
        student.place_birth = place_birth;
        student.day_birth = day_birth;
        student.religion = religion;
        student.address = address;
        student.email = email;
        student.phone = phone;
        student.entry_year = entry_year;
        student.child_no = child_no;
        student.father_name = father_name;
        student.mother_name = mother_name;
        student.father_job = father_job;
        student.mother_job = mother_job;
        student.father_education = father_education;
        student.mother_education = mother_education;
        student.father_address = father_address;
        student.mother_address = mother_address;
        student.father_email = father_email;
        student.mother_email = mother_email;
        student.father_phone = father_phone;
        student.mother_phone = mother_phone;
        student.guardian_name = guardian_name;
        student.guardian_address = guardian_address;
        student.guardian_phone = guardian_phone;
        student.guardian_relation = guardian_relation;
        await student.save()

        return response.success("Update Siswa berhasil", res, { id: student.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update Siswa", res);
    }
};
