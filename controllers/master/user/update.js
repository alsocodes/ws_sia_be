const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const {
            user_type,
            role_id,
            username,
            name,
            email,
            nip,
            nisn
        } = req.body

        const { id } = req.params
        if (username) {
            const check_username = await db.user.findOne({ where: { [Op.and]: [{ username: username }, { id: { [Op.ne]: id } }] } })
            if (check_username) {
                const error = new Error("Username sudah ada")
                error.code = 400
                throw error
            }
        }

        if (email) {
            const check_email = await db.user.findOne({ where: { [Op.and]: [{ email: email }, { id: { [Op.ne]: id } }] } })
            if (check_email) {
                const error = new Error("Email sudah ada")
                error.code = 400
                throw error
            }
        }

        if (nisn) {
            const check_nisn = await db.user.findOne({ where: { [Op.and]: [{ nisn: nisn }, { id: { [Op.ne]: id } }] } })
            if (check_nisn) {
                const error = new Error("NISN sudah ada")
                error.code = 400
                throw error
            }
        }

        if (nip) {
            const check_nip = await db.user.findOne({ where: { [Op.and]: [{ nip: nip }, { id: { [Op.ne]: id } }] } })
            if (check_nip) {
                const error = new Error("NIP sudah ada")
                error.code = 400
                throw error
            }
        }

        const user = await db.user.findOne({ where: { id: id } })
        if (!user) {
            const error = new Error("User tidak ditemukan")
            error.code = 400
            throw error
        }

        user.user_type = user_type;
        user.role_id = role_id;
        user.username = username;
        user.name = name;
        user.email = email;
        user.nip = nip;
        user.nisn = nisn;
        await user.save()

        return response.success("Update User berhasil", res, { id: user.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update User", res);
    }
};
