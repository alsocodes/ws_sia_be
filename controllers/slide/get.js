const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const slides = await db.slide.findAll({
            attributes: ['id', 'title', 'description', 'link', 'image', 'order']
        })
        return response.success("Get all slides success", res, slides, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all slides", res);
    }
};
