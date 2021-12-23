const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.updateGallery = async (req, res) => {
    try {

        const { title, description, image } = req.body;
        const { id } = req.params
        const gallery = await db.gallery.findOne({
            where: { id: id }
        })
        gallery.title = title;
        gallery.description = description;
        gallery.image = image;
        await gallery.save()

        return response.success("update gallery success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed update gallery", res);
    }
};
