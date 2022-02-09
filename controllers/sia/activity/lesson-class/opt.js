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

        const semesters = await db.semester.findAll({
            attributes: ['id', 'code', 'name', 'status'],
            // where: { status: 'active' }
        })

        const classrooms = await db.classroom.findAll({
            attributes: ['id', 'code', 'room', 'name']
        })

        const teachers = await db.teacher.findAll({
            attributes: ['id', 'nip', 'name']
        })

        const lessons = await db.lesson.findAll({
            attributes: ['id', 'code', 'name']
        })

        const result = {
            eduyears: eduyears,
            semesters: semesters,
            classrooms: classrooms,
            teachers: teachers,
            lessons: lessons,
        }


        return response.success("Sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
