const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.setAlbumGallery = async (req, res) => {
    try {

        const { album_id, galleries } = req.body;
        const album_gals = await db.album_gallery.findAll({
            attributes: ['gallery_id'],
            where: { album_id: album_id }
        })

        let saved_galls = album_gals.map((item) => item.dataValues.gallery_id);

        let new_galls = galleries

        let mergeds = new_galls.concat(saved_galls)
        mergeds = [...new Set([...new_galls, ...saved_galls])]

        await Promise.all(mergeds.map(async (item) => {
            if (!saved_galls.includes(item)) {
                // insert
                await db.album_gallery.create({
                    album_id: album_id,
                    gallery_id: item
                })
            } else if (!new_galls.includes(item)) {
                await db.album_gallery.destroy({
                    where: {
                        [Op.and]: [{ album_id: album_id }, { gallery_id: item }]
                    }
                })

            }
        }))

        return response.success("Set album gallery success", res, {}, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed Set album gallery", res);
    }
};
