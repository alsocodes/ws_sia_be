const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op } = require("sequelize");

exports.update = async (req, res) => {
    // const t = await sequelize.transaction();
    try {
        const { id } = req.params
        const {
            name,
            post_id,
            link,
            type
        } = req.body

        await db.menu.update({
            name: name,
            post_id: post_id === '' ? null : post_id,
            link: link === '/' ? '' : link,
            type: type
        }, {
            where: { id: id }
        })

        return response.success("Update menu success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed Update menu", res);
    }
};
