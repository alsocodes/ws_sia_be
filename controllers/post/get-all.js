const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getAll = async (req, res) => {
    try {
        const { type } = req.params
        if (!type) return response.invalidInput('jenis tidak boleh kosong', res)

        const page = parseInt(!req.query.page ? 1 : req.query.page)
        const page_size = parseInt(!req.query.page_size ? 20 : req.query.page_size)
        const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;
        const orderby = !req.query.orderby ? 'id' : req.query.orderby
        const order = !req.query.order ? 'desc' : req.query.order

        const posts = await db.post.findAndCountAll({
            attributes: [
                'id', 'title', 'content', 'excerpt',
                'image',
                'type', 'status', 'visibility', 'comment_status',
                'slug', 'tags',
                'created_at'
            ],
            include: [
                {
                    model: db.user,
                    as: 'author',
                    attributes: ['id', 'name']
                }
            ],
            where: {
                [Op.and]: [
                    { type: type },
                    {
                        title: {
                            [Op.like]: '%' + search + '%',
                        }
                    },
                ]
            },
            distinct: true,
            offset: offset,
            limit: limit,
            order: [
                [orderby, order]
            ]
        })

        const result = {
            total_count: posts.count,
            total_page: Math.ceil(posts.count / page_size),
            rows: posts.rows
        }

        return response.success("Get all post success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all post", res);
    }
};
