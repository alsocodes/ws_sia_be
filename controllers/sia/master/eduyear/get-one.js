const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {

        const { id } = req.params

        const eduyear = await db.eduyear.findOne({
            attributes: [
                'id', 'code', 'name', 'created_at'
            ],
            where: { id: id },
        })

        return response.success("Get tahun ajaran sukses ", res, eduyear, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
