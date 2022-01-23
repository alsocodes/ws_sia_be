const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");
const bcrypt = require('bcrypt')

exports.changePassword = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        const {
            old_password, new_password
        } = req.body

        const user = await db.user.findOne({ where: { id: req.user.id } })
        const compare = await bcrypt.compare(old_password, user.password);
        if (!compare) return response.invalidInput("Password lama tidak sesuai", res)

        user.password = await bcrypt.hash(new_password, 10)
        await user.save({ transaction: t })

        await t.commit()
        return response.success("Success", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed", res);
    }
};
