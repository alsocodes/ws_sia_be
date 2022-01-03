const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {

        const { slug } = req.params
        let post = await db.post.findOne({
            attributes: [
                'title', 'excerpt', 'content', 'slug', 'created_at', 'type',
                [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image'],
                'tags'
            ],
            include: {
                model: db.user,
                attributes: ['name', 'id']
            },
            where: {
                slug: slug
            }
        })

        const latest = await db.post.findAll({
            attributes: [
                'title', 'content', 'excerpt', 'slug', 'created_at',
                [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
            ],
            where: { type: post.type },
            offset: 0,
            limit: 4,
            order: [['created_at', 'desc']],
        })

        // let result = { ...post }
        // post['latest'] = latest
        let result = {}
        let data = post.dataValues
        for (var key in data) {
            result[key] = post[key]
        }
        result['latest'] = latest

        return response.success("Get post success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get post", res);
    }
};
