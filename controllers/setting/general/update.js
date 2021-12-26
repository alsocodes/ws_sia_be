const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op } = require("sequelize");

exports.update = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const {
            generals
        } = req.body

        await Promise.all(generals.map(async (item) => {
            await db.general.update({ value: item.value }, { where: { name: item.name }, transaction: t })
        }))

        await t.commit()
        return response.success("Update General setting success", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed update General setting", res);
    }
};
