const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const {
            code,
            name
        } = req.body

        const { id } = req.params
        const lesson = await db.lesson.findOne({ where: { id: id } })
        if (!lesson) return response.invalidInput('Pelajaran tidak ditemukan', res)

        let check = await db.lesson.findOne({ where: { [Op.and]: [{ name: name }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Nama pelajaran sudah ada', res)

        check = await db.lesson.findOne({ where: { [Op.and]: [{ code: code }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Kode pelajaran sudah ada', res)

        lesson.code = code;
        lesson.name = name;
        await lesson.save()

        return response.success("Update pelajaran berhasil", res, { id: lesson.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update pelajaran", res);
    }
};
