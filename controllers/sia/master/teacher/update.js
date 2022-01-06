const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const {
            nip, name, gender, place_birth, day_birth, religion, address,
            employee_group, position, last_education,
            email, phone, entry_year
        } = req.body

        const { id } = req.params
        const teacher = await db.teacher.findOne({ where: { id: id } })
        if (!teacher) return response.invalidInput('Guru tidak ditemukan', res)

        let check = await db.teacher.findOne({ where: { [Op.and]: [{ nip: nip }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('NIP sudah ada', res)

        check = await db.teacher.findOne({ where: { [Op.and]: [{ email: email }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Email sudah ada', res)

        teacher.nip = nip;
        teacher.name = name;
        teacher.gender = gender;
        teacher.place_birth = place_birth;
        teacher.day_birth = day_birth;
        teacher.religion = religion;
        teacher.address = address;
        teacher.employee_group = employee_group;
        teacher.position = position;
        teacher.last_education = last_education;
        teacher.email = email;
        teacher.phone = phone;
        teacher.entry_year = entry_year;
        await teacher.save()

        return response.success("Update Guru berhasil", res, { id: teacher.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update Guru", res);
    }
};
