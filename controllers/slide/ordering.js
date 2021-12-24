const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.ordering = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const {
            orders
        } = req.body

        await Promise.all(orders.map(async (item) => {
            await db.slide.update({
                order: item.order
            }, {
                where: { id: item.id },
                transaction: t
            })
        }))

        await t.commit()

        return response.success("Set order slides success", res, {}, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed Set order slides", res);
    }
};
