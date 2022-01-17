const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const {
            name,
            accesses
        } = req.body

        let check = await db.role.findOne({ where: { name: name } })
        if (check) return response.invalidInput('Nama role sudah ada', res)

        const role = await db.role.create({
            name: name,
        }, { transaction: t })

        await Promise.all(accesses.map(async (item) => {
            const access = await db.access.findOne({ where: { name: item } })
            await db.role_access.create({
                role_id: role.id,
                access_id: access.id
            }, { transaction: t })
        }))
        await t.commit()
        return response.success("Menambahkan role berhasil", res, { id: role.id }, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal menambahkan role", res);
    }
};
