const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {

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

        // const menu = {
        //     top : [],
        //     main : [],
        //     bottom1 : [],
        //     bottom2 : []
        // }

        return response.success("Get all generals success", res, menu, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all generals", res);
    }
};
