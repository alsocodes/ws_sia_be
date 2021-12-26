const db = require("../../../models");
const helper = require("../../../utils/helper");
const response = require("../../../utils/response");
const sequelize = require('../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getStructure = async (req, res) => {
    try {
        const { type } = req.headers
        const menus = await db.menu.findAll({
            attributes: ['id', [Sequelize.col('menus.name'), 'text']],
            include: {
                model: db.menu,
                attributes: ['id', [Sequelize.col('name'), 'text']],
                as: 'children',
                required: false,
                where: {
                    [Op.and]: [{ type: type }, { parent_id: { [Op.ne]: 0 } }]
                },
                include: {
                    model: db.menu,
                    attributes: ['id', [Sequelize.col('name'), 'text']],
                    as: 'children',
                    required: false,
                    where: {
                        [Op.and]: [{ type: type }, { parent_id: { [Op.ne]: 0 } }]
                    },
                    order: [
                        ['urut', 'asc']
                    ],
                }
            },
            where: {
                [Op.and]: [{ type: type }, { parent_id: 0 }]
            },
            order: [
                ['urut', 'asc'],
                [
                    { model: db.menu, as: 'children' },
                    'urut', 'asc'
                ]
            ]
        })



        return response.success("Get all menus success", res, menus, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get all menus", res);
    }
};
