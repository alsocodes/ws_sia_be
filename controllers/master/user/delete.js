const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const user = await db.user.findOne({ where: { id: id } })
        if (!user) return response.invalidInput('User tidak ditemukan', res)
        await user.destroy()

        return response.success("Hapus User berhasil", res, { id: user.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus User", res);
    }
};
