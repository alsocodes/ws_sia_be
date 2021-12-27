const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const generals = await db.general.findAll({
            attributes: ['name', 'value'],
        })

        let obj = {}
        generals.map(item => {
            obj[item.name] = item.value
        })

        return response.success("Get all generals success", res, obj, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all generals", res);
    }
};
