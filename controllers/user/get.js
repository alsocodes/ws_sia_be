const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        if (!req.headers.business_id) {
            return response.invalidInput("Business_id is required in your header", res);
        }

        const business = await db.business.findOne({ where: { public_id: req.headers.business_id } })
        if (!business) {
            return response.invalidInput("Invalid business", res);
        }

        const page = parseInt(!req.query.page ? 1 : req.query.page)
        const page_size = parseInt(!req.query.page_size ? 20 : req.query.page_size)
        const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;

        const users = await db.user.findAndCountAll({
            attributes: [
                'public_id', 'name', 'email', 'phone_number'
            ],
            include: [
                {
                    model: db.role,
                    attributes: ['public_id', 'name']
                },
                {
                    model: db.outlet_user,
                    attributes: ['public_id'],
                    include: {
                        model: db.outlet,
                        attributes: ['public_id', 'name']
                    }
                }
            ],
            where: {
                [Op.and]: [
                    { business_id: business.id }, { is_active: true },
                    {
                        name: {
                            [Op.iLike]: '%' + search + '%',
                        }
                    },
                ]
            },
            distinct: true,
            offset: offset,
            limit: limit,
        })

        const result = {
            total_count: users.count,
            total_page: Math.ceil(users.count / page_size),
            rows: users.rows
        }

        return response.success('get discount success', res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed get discount", res);
    }
};
