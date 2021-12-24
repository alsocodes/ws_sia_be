const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const { id } = req.params
        const {
            title, description, link, image, order
        } = req.body
        const slide = await db.slide.findOne({ where: { id: id } })

        slide.title = title
        slide.description = description
        slide.link = link
        slide.image = image
        slide.order = order

        await slide.save()

        return response.success("Update slides success", res, {}, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed update slides", res);
    }
};
