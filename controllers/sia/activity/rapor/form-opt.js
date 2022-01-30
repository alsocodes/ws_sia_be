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

        const semesters = await db.semester.findAll({
            attributes: ['id', 'code', 'name']
        })

        const classrooms = await db.classroom.findAll({
            attributes: ['id', 'code', 'room', 'name']
        })

        const result = { eduyears, semesters, classrooms }

        return response.success("Get siswa menduduki kelas sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get siswa menduduki kelas", res);
    }
};
