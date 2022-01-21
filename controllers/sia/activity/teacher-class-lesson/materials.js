const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { lesson_class_id } = req.params
        const lesson_class_materials = await db.lesson_class_material.findAll({
            attributes: [
                'id', 'name', 'description',
                'created_at',
                'attachment',
                [Sequelize.fn('concat', helper.attachmentUrl, Sequelize.col('attachment')), 'attachment_url'],
            ],
            where: {
                lesson_class_id: lesson_class_id,
            },
            order: [['created_at', 'desc']]
        })


        return response.success("Get materi kelas sukses", res, lesson_class_materials, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get materi kelas", res);
    }
};
