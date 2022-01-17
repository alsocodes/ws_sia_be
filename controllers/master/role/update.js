const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const {
            name,
            accesses
        } = req.body

        const { id } = req.params
        const role = await db.role.findOne({ where: { id: id } })
        if (!role) return response.invalidInput('Role tidak ditemukan', res)

        let check = await db.role.findOne({ where: { [Op.and]: [{ name: name }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Nama Role sudah ada', res)

        role.name = name;
        await role.save({ transaction: t })

        const role_access = await db.role_access.findAll({
            attributes: ['access_id'],
            where: { role_id: role.id }
        })

        let saved_accesses = await role_access.map((item) => item.access_id);
        let new_accesses = await Promise.all(accesses.map(async (item) => {
            const access = await db.access.findOne({ where: { 'name': item } })
            return access.id
        }))

        let merge_accesses = new_accesses.concat(saved_accesses)
        merge_accesses = [...new Set([...new_accesses, ...saved_accesses])]

        await Promise.all(merge_accesses.map(async (item) => {
            if (!saved_accesses.includes(item)) {
                await db.role_access.create({
                    role_id: role.id,
                    access_id: item
                }, { transaction: t })
            } else if (!new_accesses.includes(item)) {
                await db.role_access.destroy({ where: { [Op.and]: [{ role_id: role.id }, { access_id: item }] }, transaction: t })
            }
        }))

        await t.commit()
        return response.success("Update Role berhasil", res, { id: role.id }, 200);
    } catch (err) {
        await t.rollback()
        console.log(err);
        return response.error(err.message || "Gagal update pelajaran", res);
    }
};
