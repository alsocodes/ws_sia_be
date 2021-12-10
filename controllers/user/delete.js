const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {
        if (!req.headers.business_id) {
            return response.invalidInput("Business_id is required", res);
        }

        const business = await db.business.findOne({ where: { public_id: req.headers.business_id } })
        if (!business) {
            return response.invalidInput("Invalid business", res);
        }

        if (!req.params.user_id) {
            return response.invalidInput("User is required", res);
        }

        const user = await db.user.findOne({ where: { public_id: req.params.user_id } })
        if (!user) {
            return response.invalidInput("User invalid", res);
        }

        user.is_active = false
        await user.destroy()

        return response.success("Delete user success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed delete user", res);
    }
};
