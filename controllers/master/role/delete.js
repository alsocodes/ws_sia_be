const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const role = await db.role.findOne({ where: { id: id } })
        if (!role) return response.invalidInput('Role tidak ditemukan', res)
        await role.destroy()

        return response.success("Hapus Role berhasil", res, { id: role.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus Role", res);
    }
};
