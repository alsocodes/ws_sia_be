const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");
const bcrypt = require('bcrypt');

exports.resetPassword = async (req, res) => {
    try {
        const { id } = req.params
        const user = await db.user.findOne({ where: { id: id } })
        if (!user) {
            const error = new Error("User tidak ditemukan")
            error.code = 400
            throw error
        }

        user.password = await bcrypt.hash('12345678', 10)
        await user.save()

        return response.success("Reset password berhasil", res, { id: user.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal reset password", res);
    }
};
