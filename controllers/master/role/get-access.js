const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getAccess = async (req, res) => {
    try {

        const accesses = await db.access.findAll({
            attributes: [
                'id', 'parent_id', 'name', 'label'
            ],
        })

        return response.success("Get all access success", res, accesses, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all access", res);
    }
};
