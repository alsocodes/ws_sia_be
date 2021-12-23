const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.update = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const { slides } = req.body;

        await Promise.all(slides.map(async (item) => {
            const {
                id, is_delete, title, description, link, image, order
            } = item
            if (!id) {
                await db.slide.create({
                    title: title,
                    description: description,
                    link: link,
                    image: image,
                    order: order
                }, { transaction: t })
            } else {
                const slide = await db.slide.findOne({ where: { id: id } })
                if (is_delete === true) {
                    await slide.destroy({ transaction: t })
                } else {
                    slide.title = title
                    slide.description = description
                    slide.link = link
                    slide.image = image
                    slide.order = order

                    await slide.save({ transaction: t })
                }
            }
        }))

        await t.commit()

        return response.success("Update slides success", res, {}, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed update slides", res);
    }
};
