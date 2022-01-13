const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOpt = async (req, res) => {
    // const t = await sequelize.transaction();
    try {

        const lesson_class = await db.lesson_class.findAll({
            attributes: ['id', 'status'],
            include: [
                {
                    model: db.lesson,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.classroom,
                    attributes: ['id', 'code', 'room', 'name']
                },
                {
                    model: db.eduyear,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.semester,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.teacher,
                    attributes: ['id', 'nip', 'name']
                },
            ],
            raw: true,
            where: {
                status: 'active'
            }
        })


        return response.success("Sukses", res, lesson_class, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
