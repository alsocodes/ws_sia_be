const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        if (!req.headers.business_id) {
            return response.invalidInput("Business_id is required", res);
        }

        const business = await db.business.findOne({ where: { public_id: req.headers.business_id } })
        if (!business) {
            return response.invalidInput("Invalid business", res);
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

        const cek_email = await db.user.findOne({ where: { email: email } })
        if (cek_email) {
            return response.invalidInput("Alamat email sudah digunakan", res);
        }

        if (phone_number) {
            const cek_phone = await db.user.findOne({ where: { phone_number: phone_number } })
            if (cek_phone) {
                return response.invalidInput("Nomor telp sudah digunakan", res);
            }
        }

        const role = await db.role.findOne({ where: { public_id: role_id } })
        if (!role) {
            return response.invalidInput("Invalid role", res);
        }

        const user = await db.user.create({
            business_id: business.id,
            name: name,
            email: email,
            pin: pin,
            role_id: role.id,
            phone_number
        }, { transaction: t })

        if (user) {
            await Promise.all(outlet_ids.map(async (item) => {
                let outlet = await db.outlet.findOne({ where: { public_id: item } })
                await db.outlet_user.create({
                    outlet_id: outlet.id,
                    user_id: user.id
                }, { transaction: t })
            }))
        }

        t.commit()

        return response.success("Create user success", res, {
            public_id: user.public_id
        }, 201);
    } catch (err) {
        console.log(err);
        t.rollback()
        return response.error(err.message || "Failed create user", res);
    }
};
