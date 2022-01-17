const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {

        const { id } = req.params

        const role = await db.role.findOne({
            attributes: [
                'id', 'name', 'created_at'
            ],
            include: {
                model: db.role_access,
                attributes: ['access_id'],
                include: {
                    model: db.access,
                    attributes: ['id', 'name']
                }
            },
            where: { id: id },
        })

        return response.success("Get role success", res, role, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get role", res);
    }
};
