const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { id } = req.params
        const lesson_class_materials = await db.lesson_class_material.findAll({
            attributes: [
                'id', 'name', 'description', 'attachment', 'created_at'
            ],
            where: {
                lesson_class_id: id,
            },
            order: [['created_at', 'desc']]
        })


        return response.success("Get materi kelas sukses", res, lesson_class_materials, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get materi kelas", res);
    }
};
