const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const { Op } = require("sequelize");
const sequelize = require('../../models').sequelize;

exports.update = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        if (!req.headers.business_id || !req.params.user_id) {
            return response.invalidInput("Business_id && user_id is required", res);
        }

        const business = await db.business.findOne({ where: { public_id: req.headers.business_id } })
        if (!business) {
            return response.invalidInput("Invalid business", res);
        }

        const user = await db.user.findOne({ where: { public_id: req.params.user_id } })
        if (!user) {
            return response.invalidInput("Invalid user", res);
        }

        const {
            name,
            email,
            pin,
            role_id,
            phone_number,
            outlet_ids
        } = req.body

        if (!outlet_ids || outlet_ids?.length == 0) {
            return response.invalidInput("Assign outlets is required", res);
        }

        const cek_email = await db.user.findOne({ where: { [Op.and]: [{ email: email }, { id: { [Op.ne]: user.id } }] } })
        if (cek_email) {
            return response.invalidInput("Alamat email sudah digunakan", res);
        }

        if (phone_number) {
            const cek_phone = await db.user.findOne({ where: { [Op.and]: [{ phone_number: phone_number }, { id: { [Op.ne]: user.id } }] } })
            if (cek_phone) {
                return response.invalidInput("Nomor telp sudah digunakan", res);
            }
        }

        const role = await db.role.findOne({ where: { public_id: role_id } })
        if (!role) {
            return response.invalidInput("Invalid role", res);
        }

        user.name = name;
        user.email = email;
        user.pin = pin;
        user.role_id = role.id;
        user.phone_number;

        user.save({ transaction: t })

        if (user) {
            const oldoutlets = await db.outlet_user.findAll({
                attributes: ['outlet_id'],
                where: { user_id: user.id }
            })
            const newoutlets = await db.outlet.findAll({
                attributes: ['id'],
                where: {
                    public_id: {
                        [Op.in]: outlet_ids
                    }
                }
            })

            let saved_pm = oldoutlets.map((item) => item.dataValues.outlet_id);
            let new_pm = newoutlets.map((item) => item.dataValues.id);

            let merge_pm = new_pm.concat(saved_pm)
            merge_pm = [...new Set([...new_pm, ...saved_pm])]

            console.log(merge_pm)
            await Promise.all(merge_pm.map(async (item) => {
                if (!saved_pm.includes(item)) {
                    // insert
                    await db.outlet_user.create({ user_id: user.id, outlet_id: item }, { transaction: t })
                } else if (!new_pm.includes(item)) {
                    console.log('iam here');
                    let ou = await db.outlet_user.findOne({
                        where: {
                            [Op.and]: [{ user_id: user.id }, { outlet_id: item }]
                        }
                    })

                    ou.is_active = false
                    await ou.destroy({ transaction: t })
                } else {
                    // do nothing
                }
            }))
        }

        t.commit()

        return response.success("update user success", res, {
            public_id: user.public_id
        }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed update user", res);
    }
};
