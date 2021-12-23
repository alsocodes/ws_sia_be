const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOneGallery = async (req, res) => {
    try {
        const { id } = req.params
        const gallery = await db.gallery.findOne({
            attributes: ['id', 'title', 'description', 'image', 'created_at'],
            where: { id: id }
        })
        return response.success("Get gallery success", res, gallery, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get gallery", res);
    }
};