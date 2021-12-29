const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op } = require("sequelize");

exports.create = async (req, res) => {
    // const t = await sequelize.transaction();
    try {
        const {
            name,
            post_id,
            link,
            type
        } = req.body

        console.log(req.body)
        await db.menu.create({
            name: name,
            post_id: post_id === '' ? null : post_id,
            link: link === '/' ? '' : link,
            type: type
        })

        return response.success("Create menu success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed Create menu", res);
    }
};
