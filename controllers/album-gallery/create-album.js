const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.createAlbum = async (req, res) => {
    try {

        const { title, description, image } = req.body;
        await db.album.create({
            title: title,
            description: description,
            image: image
        })

        return response.success("Create album success", res, {}, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed create album", res);
    }
};
