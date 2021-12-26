const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op } = require("sequelize");

exports.updateStructure = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const {
            structures
        } = req.body

        await updateStructure(structures, 0, t)
        await t.commit()
        console.log('after commit')
        return response.success("Update strukture menu success", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed Update strukture menu", res);
    }
};

const updateStructure = async (structures, parent, t) => {
    await Promise.all(structures.map(async (item, key) => {
        const id = item.id
        const menu = await db.menu.findOne({ where: { id: id } })
        menu.parent_id = parent
        menu.urut = `${parent}${key}`
        await menu.save({ transaction: t })
        console.log(menu.urut)
        if (item.children.length > 0) await updateStructure(item.children, id, t)
    }))
    // return true;
}