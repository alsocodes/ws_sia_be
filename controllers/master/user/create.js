const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
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

        if (username) {
            const check_username = await db.user.findOne({ where: { username: username } })
            if (check_username) {
                const error = new Error("Username sudah ada")
                error.code = 400
                throw error
            }
        }

        if (email) {
            const check_email = await db.user.findOne({ where: { email: email } })
            if (check_email) {
                const error = new Error("Email sudah ada")
                error.code = 400
                throw error
            }
        }

        if (nisn) {
            const check_nisn = await db.user.findOne({ where: { nisn: nisn } })
            if (check_nisn) {
                const error = new Error("NISN sudah ada")
                error.code = 400
                throw error
            }
        }

        if (nip) {
            const check_nip = await db.user.findOne({ where: { nip: nip } })
            if (check_nip) {
                const error = new Error("NIP sudah ada")
                error.code = 400
                throw error
            }
        }

        const user = await db.user.create({
            name: name,
            user_type: user_type,
            role_id: role_id,
            username: username,
            email: email,
            nip: nip,
            nisn: nisn
        })

        return response.success("Menambahkan user berhasil", res, { id: user.id }, 201);
    } catch (err) {
        console.log(err);
        // await t.rollback()
        return response.error(err.message || "Gagal menambahkan role", res);
    }
}
