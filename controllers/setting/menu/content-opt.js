const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getContentOpt = async (req, res) => {
    try {
        const contents = await db.post.findAll({
            attributes: [
                [Sequelize.col('id'), 'value'],
                [Sequelize.col('title'), 'label'],
                'slug',
                'type'],
        })

        return response.success("Get all contents success", res, contents, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all contents", res);
    }
};
