const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.formOpt = async (req, res) => {
    try {

        const eduyears = await db.eduyear.findAll({
            attributes: ['id', 'code', 'name']
        })

        const classrooms = await db.classroom.findAll({
            attributes: ['id', 'code', 'room', 'name'],
            where: { code: 'IX' }
        })

        const result = { eduyears, classrooms }

        return response.success("", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
