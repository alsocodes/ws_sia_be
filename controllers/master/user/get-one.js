const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {

        const { id } = req.params

        const user = await db.user.findOne({
            attributes: [
                'id', 'username', 'name', 'email', 'nisn', 'nip', 'user_type', 'created_at'
            ],
            include: {
                model: db.role,
                attributes: ['id', 'name']
            },
            where: { id: id },
        })

        return response.success("Get user success", res, user, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get user", res);
    }
};
