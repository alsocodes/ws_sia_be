const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const classroom = await db.classroom.findOne({ where: { id: id } })
        if (!classroom) return response.invalidInput('Kelas tidak ditemukan', res)
        await classroom.destroy()

        return response.success("Hapus Kelas berhasil", res, { id: classroom.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus Kelas", res);
    }
};
