const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getGallery = async (req, res) => {
    try {
        const page = parseInt(!req.query.page ? 1 : req.query.page)
        const page_size = parseInt(!req.query.page_size ? 20 : req.query.page_size)
        const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;
        const orderby = !req.query.orderby ? 'id' : req.query.orderby
        const order = !req.query.order ? 'desc' : req.query.order

        const galleries = await db.gallery.findAndCountAll({
            attributes: ['id', 'title', 'description', 'image', 'type', 'created_at'],
            distinct: true,
            offset: offset,
            limit: limit,
            order: [
                [orderby, order]
            ]
        })

        const result = {
            total_count: galleries.count,
            total_page: Math.ceil(galleries.count / page_size),
            rows: galleries.rows
        }

        return response.success("Get all galleries success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all galleries", res);
    }
};