const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const eduyear = await db.eduyear.findOne({ where: { id: id } })
        if (!eduyear) return response.invalidInput('Tahun Pelajaran tidak ditemukan', res)
        await eduyear.destroy()

        return response.success("Hapus tahun pelajaran berhasil", res, { id: eduyear.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus tahun pelajaran", res);
    }
};
