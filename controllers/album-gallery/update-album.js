const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.updateAlbum = async (req, res) => {
    try {

        const { title, description, image } = req.body;
        const { id } = req.params
        const album = await db.album.findOne({ where: { id: id } })

        album.title = title
        album.description = description
        album.image = image
        await album.save()

        return response.success("update album success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed update album", res);
    }
};
