const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.deleteGallery = async (req, res) => {
    try {

        const { id } = req.params
        const gallery = await db.gallery.findOne({
            where: { id: id }
        })

        await gallery.destroy()

        return response.success("delete gallery success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed delete gallery", res);
    }
};
