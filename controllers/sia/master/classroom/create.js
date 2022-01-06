const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    try {

        const {
            room,
            name
        } = req.body

        let check = await db.classroom.findOne({ where: { [Op.and]: [{ name: name }, { room: room }] } })
        if (check) return response.invalidInput('Kelas sudah ada', res)

        const classroom = await db.classroom.create({
            room: room,
            name: name
        })

        return response.success("Menambahkan kelas berhasil", res, { id: classroom.id }, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal menambahkan kelas", res);
    }
};
