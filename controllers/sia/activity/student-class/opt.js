const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOpt = async (req, res) => {
    // const t = await sequelize.transaction();
    try {

        const eduyears = await db.eduyear.findAll({
            attributes: ['id', 'code', 'name', 'status'],
            // where: { status: 'active' }
        })

        const classrooms = await db.classroom.findAll({
            attributes: ['id', 'code', 'room', 'name']
        })

        const students = await db.student.findAll({
            attributes: ['id', 'name']
        })

        const result = {
            classrooms: classrooms,
            eduyears: eduyears,
            students: students,
        }


        return response.success("Sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
