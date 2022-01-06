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
            nip, name, gender, place_birth, day_birth, religion, address,
            employee_group, position, last_education,
            email, phone, entry_year
        } = req.body

        let check = await db.teacher.findOne({ where: { [Op.and]: [{ nip: nip }] } })
        if (check) return response.invalidInput('NIP sudah ada', res)

        check = await db.teacher.findOne({ where: { [Op.and]: [{ email: email }] } })
        if (check) return response.invalidInput('Email sudah ada', res)

        const user = await db.user.create({
            name: name,
            email: email,
            password: await bcrypt.hash('123456', 10),
            role_id: 3,
            user_type: 'teacher'
        }, { transaction: t })

        const teacher = await db.teacher.create({
            user_id: user.id,
            nip: nip,
            name: name,
            gender: gender,
            place_birth: place_birth,
            day_birth: day_birth,
            religion: religion,
            address: address,
            employee_group: employee_group,
            position: position,
            last_education: last_education,
            email: email,
            phone: phone,
            entry_year: entry_year
        }, { transaction: t })

        t.commit();
        return response.success("Menambahkan guru berhasil", res, { id: teacher.id }, 201);
    } catch (err) {
        console.log(err);
        t.rollback();
        return response.error(err.message || "Gagal menambahkan guru", res);
    }
};
