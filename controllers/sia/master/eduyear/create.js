const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    try {

        const {
            semester,
            name
        } = req.body

        let check = await db.eduyear.findOne({ where: { [Op.and]: [{ name: name }, { semester: semester }] } })
        if (check) return response.invalidInput('Tahun ajaran sudah ada', res)

        const eduyear = await db.eduyear.create({
            semester: semester,
            name: name
        })

        return response.success("Menambahkan pelajaran berhasil", res, { id: eduyear.id }, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal menambahkan pelajaran", res);
    }
};
