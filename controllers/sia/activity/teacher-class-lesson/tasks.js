const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { id } = req.params
        const lesson_class_tasks = await db.lesson_class_task.findAll({
            attributes: [
                'id', 'name', 'description', 'attachment', 'status', 'deadline_at', 'open_at', 'close_at', 'created_at'
            ],
            where: {
                lesson_class_id: id,
            },
            order: [['created_at', 'desc']]
        })


        return response.success("Get tugas kelas sukses", res, lesson_class_tasks, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get tugas kelas", res);
    }
};
