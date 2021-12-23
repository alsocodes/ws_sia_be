const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.deleteAlbum = async (req, res) => {
    try {

        const { id } = req.params
        const album = await db.album.findOne({
            where: { id: id }
        })

        await album.destroy()

        return response.success("delete album success", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed delete album", res);
    }
};
