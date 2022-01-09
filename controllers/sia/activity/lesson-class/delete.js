const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const user = req.user
        const lesson_class = await db.lesson_class.findOne({where : {id:id}})
        if(!lesson_class) return response.invalidInput("Tidak ditemukan", res)
        lesson_class.deleted_by = user.id
        await lesson_class.destroy()

        return response.success("Hapus pembelajaran kelas sukses", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus pembelajaran kelas", res);
    }
};
