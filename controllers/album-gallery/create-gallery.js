const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.createGallery = async (req, res) => {
    try {

        const { title, description, image, type_gallery } = req.body;
        await db.gallery.create({
            title: title,
            description: description,
            image: image,
            type: type_gallery
        })

        return response.success("Create gallery success", res, {}, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed create gallery", res);
    }
};
