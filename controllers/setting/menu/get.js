const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { type } = req.headers
        const menus = await db.menu.findAll({
            attributes: ['id', 'name', 'parent_id', 'link', 'post_id', 'type', 'target'],
            where: {
                type: type
            }
        })

        return response.success("Get all menus success", res, menus, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all menus", res);
    }
};
