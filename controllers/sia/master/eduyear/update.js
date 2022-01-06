const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.update = async (req, res) => {
    try {

        const {
            semester,
            name
        } = req.body

        const { id } = req.params
        const eduyear = await db.eduyear.findOne({ where: { id: id } })
        if (!eduyear) return response.invalidInput('Tahun ajaran tidak ditemukan', res)

        let check = await db.eduyear.findOne({ where: { [Op.and]: [{ name: name }, { semester: semester }, { id: { [Op.ne]: id } }] } })
        if (check) return response.invalidInput('Tahun pelajaran sudah ada', res)

        eduyear.semester = semester;
        eduyear.name = name;
        await eduyear.save()

        return response.success("Update tahun pelajaran berhasil", res, { id: eduyear.id }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal update tahun pelajaran", res);
    }
};
