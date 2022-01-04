const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const data = req.query.data.split(",")
        const result = {}
        // general, menu, slides, sambutan, headline, agenda, news

        if (data.includes('general')) {
            const generals = await db.general.findAll({
                attributes: ['name', 'value'],
            })

            let general = {}
            generals.map(item => {
                general[item.name] = item.value
            })
            result['general'] = general
        }

        if (data.includes('menu')) {
            const menus = await db.menu.findAll({
                attributes: ['id', [Sequelize.col('menus.name'), 'text'], 'type', 'link'],
                include: {
                    model: db.menu,
                    attributes: ['id', [Sequelize.col('name'), 'text'], 'link'],
                    as: 'children',
                    required: false,
                    where: {
                        [Op.and]: [{ parent_id: { [Op.ne]: 0 } }]
                    },
                    include: {
                        model: db.menu,
                        attributes: ['id', [Sequelize.col('name'), 'text'], 'link'],
                        as: 'children',
                        required: false,
                        where: {
                            [Op.and]: [{ parent_id: { [Op.ne]: 0 } }]
                        },
                        order: [
                            ['urut', 'asc']
                        ],
                    }
                },
                where: {
                    [Op.and]: [{ parent_id: 0 }]
                },
                order: [
                    ['urut', 'asc'],
                    [
                        { model: db.menu, as: 'children' },
                        'urut', 'asc'
                    ]
                ]
            })

            let menu = {}
            menus.map(item => {
                if (!menu[item.type]) menu[item.type] = []
                menu[item.type].push(item)
            })
            result['menu'] = menu
        }

        if (data.includes('slides')) {
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
            result['slides'] = slides
        }

        if (data.includes('sambutan')) {
            const sambutan = await db.post.findOne({
                attributes: [
                    'title', 'content', 'excerpt', 'slug',
                    [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
                ],
                where: { type: 'preface' }
            })
            result['sambutan'] = sambutan
        }

        if (data.includes('headline')) {
            const headline = await db.post.findOne({
                attributes: [
                    'title', 'content', 'excerpt', 'slug',
                    [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
                ],
                include: [
                    {
                        model: db.post_meta,
                        required: true,
                        as: 'req_post_meta',
                        attributes: [],
                        where: {
                            [Op.and]: [{ name: 'mtdt_headline_one', value: 1 }]
                        }
                    },
                    {
                        model: db.post_meta,
                        as: 'post_meta',
                        attributes: ['name', 'value'],
                    }
                ],
                where: { type: 'news' }
            })

            result['headline'] = headline
        }


        if (data.includes('agenda')) {
            const agenda = await db.post.findAll({
                attributes: [
                    'title', 'content', 'excerpt', 'slug', 'agenda_date'
                ],
                where: { type: 'agenda' },
                offset: 0,
                limit: 4,
                order: [['agenda_date', 'asc']],
            })
            result['agenda'] = agenda
        }

        if (data.includes('news')) {
            const news = await db.post.findAll({
                attributes: [
                    'title', 'content', 'excerpt', 'slug',
                    [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
                ],
                where: { type: 'news' },
                offset: 0,
                limit: 4,
                order: [['created_at', 'desc']],
            })
            result['news'] = news
        }

        if (data.includes("gallery")) {
            const galleries = await db.gallery.findAll({
                attributes: [
                    'id', 'title', 'description',
                    'type',
                    [Sequelize.literal(`CASE WHEN type = 'image' THEN CONCAT('${helper.imageUrl}','400-',image) ELSE CONCAT('https://img.youtube.com/vi/',image,'/sddefault.jpg') END`), 'image'],
                    [Sequelize.literal(`CASE WHEN type = 'image' THEN CONCAT('${helper.imageUrl}',image) ELSE CONCAT('https://www.youtube.com/embed/',image) END`), 'image_large']
                ],
                offset: 0,
                limit: 8,
                order: [['created_at', 'desc']],
            })
            result['galleries'] = galleries
        }

        if (data.includes('article')) {
            const articles = await db.post.findAll({
                attributes: [
                    'title', 'content', 'excerpt', 'slug',
                    [Sequelize.fn('concat', helper.imageUrl, '600-', Sequelize.col('image')), 'image']
                ],
                where: { type: 'article' },
                offset: 0,
                limit: 4,
                order: [['created_at', 'desc']],
            })
            result['articles'] = articles
        }


        return response.success("Get all generals success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all generals", res);
    }
};
