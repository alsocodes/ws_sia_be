const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op } = require("sequelize");

exports.del = async (req, res) => {
    // const t = await sequelize.transaction();
    try {
        const { id } = req.params


        const menu = await db.menu.findOne({ where: { id: id } })
        await menu.destroy()

        return response.success("Delete menu success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed Delete menu", res);
    }
};
