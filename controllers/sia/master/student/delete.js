const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const student = await db.student.findOne({ where: { id: id } })
        if (!student) return response.invalidInput('Siswa tidak ditemukan', res)
        await student.destroy()

        return response.success("Hapus Siswa berhasil", res, { id: student.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus Siswa", res);
    }
};
