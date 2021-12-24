const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const {
            title, description, link, image
        } = req.body

        const last = await db.slide.max('order')
        const order = last + 1
        await db.slide.create({
            title: title,
            description: description,
            link: link,
            image: image,
            order: order
        }, { transaction: t })

        await t.commit()

        return response.success("Create slides success", res, {}, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed Create slides", res);
    }
};
