const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOneAlbum = async (req, res) => {
    try {

        const { id } = req.params
        const album = await db.album.findOne({
            attributes: ['id', 'title', 'description', 'image', 'created_at'],
            include: {
                model: db.album_gallery,
                attributes: ['id'],
                include: {
                    model: db.gallery,
                    attributes: ['id', 'title', 'description', 'image']
                }
            },
            where: {
                id: id
            }
        })


        return response.success("Get album success", res, album, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get album", res);
    }
};