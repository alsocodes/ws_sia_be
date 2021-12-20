const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;

exports.getOne = async (req, res) => {
    try {
        const { id } = req.params
        if (!id) return response.invalidInput('id tidak boleh kosong', res)

        const postOne = await db.post.findOne({ where: { id: id } })
        if (!postOne) return response.invalidInput('Tidak ditemukan', res)
        return response.success("Get post success", res, postOne, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed get post", res);
    }
};
