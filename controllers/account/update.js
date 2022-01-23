const db = require("../../models");
const helper = require("../../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.updateProfile = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const {
            name,
            email
        } = req.body
        const { id } = req.params
        const check = await db.user.findOne({ where: { email: email, id: { [Op.ne]: id } } })
        const user = await db.user.findOne({ where: { id: id } })
        if (check) return response.invalidInput("Email sudah digunakan", res)

        user.name = name
        user.email = email
        await user.save({ transaction: t })

        await t.commit()
        return response.success("Update", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed", res);
    }
};
