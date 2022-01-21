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
            answer,
            attachment,
            status,
        } = req.body

        const { task_id } = req.params
        const user = req.user
        const student = await db.student.findOne({
            attributes: ['id', 'name'],
            include: {
                model: db.user,
                where: { id: user.id }
            }
        })

        const create = await db.lesson_class_task_submit.create({
            lesson_class_task_id: task_id,
            student_id: student.id,
            answer: answer,
            attachment: attachment,
            status: status,
            open_at: status === 'submit' ? Sequelize.literal('CURRENT_TIMESTAMP') : null,
        }, { transaction: t })

        await t.commit()
        return response.success("Berhasil", res, { id: create.id }, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
