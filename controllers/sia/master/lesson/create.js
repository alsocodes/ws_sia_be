const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    try {

        const {
            code,
            name
        } = req.body

        let check = await db.lesson.findOne({ where: { name: name } })
        if (check) return response.invalidInput('Nama pelajaran sudah ada', res)

        check = await db.lesson.findOne({ where: { code: code } })
        if (check) return response.invalidInput('Kode pelajaran sudah ada', res)

        const lesson = await db.lesson.create({
            code: code,
            name: name
        })

        return response.success("Menambahkan pelajaran berhasil", res, { id: lesson.id }, 201);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal menambahkan pelajaran", res);
    }
};
