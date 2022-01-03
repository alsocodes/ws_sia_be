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
        const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;

        const posts = await db.post.findAndCountAll({
            attributes: [
                'title', 'excerpt', 'content', 'slug', 'created_at',
                [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
            ],
            include: {
                model: db.user,
                attributes: ['name', 'id']
            },
            where: {
                type: type
            },
            distinct: true,
            offset: offset,
            limit: limit,
        })

        const latest = await db.post.findAll({
            attributes: [
                'title', 'content', 'excerpt', 'slug', 'created_at',
                [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
            ],
            where: { type: type },
            offset: 0,
            limit: 4,
            order: [['created_at', 'desc']],
        })

        const result = {
            total_count: posts.count,
            total_page: Math.ceil(posts.count / page_size),
            rows: posts.rows,
            latest: latest
        }

        return response.success("Get all posts success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all posts", res);
    }
};
