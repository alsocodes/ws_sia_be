const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const teacher = await db.teacher.findOne({ where: { id: id } })
        if (!teacher) return response.invalidInput('Guru tidak ditemukan', res)
        await teacher.destroy()

        return response.success("Hapus guru berhasil", res, { id: teacher.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus guru", res);
    }
};
