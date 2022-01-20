const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.taskSubmitCreate = async (req, res) => {
    const t = await sequelize.transaction();
    let flag;
    try {

        const {
            name,
            description,
            attachment,
            deadline_at,
            status,
        } = req.body

        const { lesson_class_id } = req.params
        const user = req.user
        if (status === 'close') return response.invalidInput("Tugas belum dibuka", res)

        const create = await db.lesson_class_task.create({
            lesson_class_id: lesson_class_id,
            name: name,
            description: description,
            attachment: attachment,
            deadline_at: deadline_at,
            status: status,
            open_at: status === 'open' ? Sequelize.NOW : null,
        }, { transaction: t })

        await t.commit()
        return response.success("Berhasil", res, { id: create.id }, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
