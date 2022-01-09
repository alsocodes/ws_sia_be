const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {

        const semesters = await db.semester.findAll({
            attributes: ['id', 'code', 'name', 'status']
        })

        let year = new Date().getFullYear() - 1
        const eduyears = await db.eduyear.findAll({
            attributes: ['id', 'code', 'name', 'status'],
            where: {
                code: { [Op.gte]: year }
            }
        })

        const result = {
            semesters: semesters,
            eduyears: eduyears
        }

        return response.success("Get siswa sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get siswa", res);
    }
};
