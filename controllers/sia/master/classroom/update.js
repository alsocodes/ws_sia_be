const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const {
            room,
            name
        } = req.body

        const { id } = req.params
        const classroom = await db.classroom.findOne({ where: { id: id } })
        if (!classroom) return response.invalidInput('Kelas tidak ditemukan', res)

        let check = await db.classroom.findOne({ where: { [Op.and]: [{ name: name }, { room: room }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Kelas sudah ada', res)

        classroom.room = room;
        classroom.name = name;
        await classroom.save()

        return response.success("Update Kelas berhasil", res, { id: classroom.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update Kelas", res);
    }
};
