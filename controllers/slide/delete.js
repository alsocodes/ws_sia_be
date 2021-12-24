const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.del = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const { id } = req.params
        const slide = await db.slide.findOne({ where: { id: id } })
        if (!slide) return response.invalidInput('Tidak ditemukan', res)

        await slide.destroy({ transaction: t })

        await t.commit()

        return response.success("Delete slide success", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed delete slide", res);
    }
};
