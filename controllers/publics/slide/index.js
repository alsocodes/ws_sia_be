const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const slides = await db.slide.findAll({
            attributes: [
                [Sequelize.col('title'), 'altText'],
                // [Sequelize.col('description'), 'caption'],
                [Sequelize.fn('concat', ''), 'caption'],
                'link',
                [Sequelize.fn('concat', helper.imageUrl, '1200-', Sequelize.col('image')), 'src']
            ],
            order: [
                ['order', 'asc']
            ]
        })

        return response.success("Get all generals success", res, slides, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all generals", res);
    }
};
