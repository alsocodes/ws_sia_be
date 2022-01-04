const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {


        const type = req.query.type
        const page = parseInt(!req.query.page ? 1 : req.query.page)
        const page_size = parseInt(!req.query.page_size ? 20 : req.query.page_size)
        // const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;

        const galleries = await db.gallery.findAndCountAll({
            attributes: [
                'id', 'title', 'description',
                'type',
                [Sequelize.literal(`CASE WHEN type = 'image' THEN CONCAT('${helper.imageUrl}','400-',image) ELSE CONCAT('https://img.youtube.com/vi/',image,'/sddefault.jpg') END`), 'image'],
                [Sequelize.literal(`CASE WHEN type = 'image' THEN CONCAT('${helper.imageUrl}',image) ELSE CONCAT('https://www.youtube.com/embed/',image) END`), 'image_large']
            ],

            distinct: true,
            offset: offset,
            limit: limit,
            order: [['created_at', 'desc']],
        })

        const result = {
            total_count: galleries.count,
            total_page: Math.ceil(galleries.count / page_size),
            rows: galleries.rows,
        }

        return response.success("Get all galleries success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all posts", res);
    }
};
