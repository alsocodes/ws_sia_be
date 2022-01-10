const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.del = async (req, res) => {
    try {

        const { id } = req.params
        const user = req.user
        const student_class = await db.student_class.findOne({ where: { id: id } })
        if (!student_class) return response.invalidInput("Tidak ditemukan", res)
        student_class.deleted_by = user.id
        await student_class.destroy()

        return response.success("Hapus sukses", res, {}, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal hapus", res);
    }
};
