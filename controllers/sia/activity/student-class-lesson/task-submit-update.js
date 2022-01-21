const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");
const fs = require('fs');
const path = require('path');
const dir_attachment = path.join(__dirname, "../../../../public/attachments/")

exports.taskSubmitUpdate = async (req, res) => {
    const t = await sequelize.transaction();
    let flag;
    try {

        const {
            answer,
            attachment,
            status,
        } = req.body

        const { lesson_class_id, task_id, id } = req.params
        const user = req.user
        const lesson_class_task_submit = await db.lesson_class_task_submit.findOne({
            where: { [Op.and]: [{ id: id }, { lesson_class_task_id: task_id }] }
        })
        if (!lesson_class_task_submit) return response.invalidInput("Tidak ditemukan", res)
        if (lesson_class_task_submit.attachment && attachment) {
            if (fs.existsSync(dir_attachment + lesson_class_task_submit.attachment)) fs.unlinkSync(dir_attachment + lesson_class_task_submit.attachment)
        }

        if (status === 'draft' && lesson_class_task_submit.status === 'submit') {
            return response.invalidInput("Tugas yang sudah disubmit tidak bisa diubah", res)
        }

        lesson_class_task_submit.answer = answer;
        lesson_class_task_submit.attachment = attachment;
        lesson_class_task_submit.status = status;
        lesson_class_task_submit.submitted_at = status === 'submit' ? Sequelize.literal('CURRENT_TIMESTAMP') : null

        await lesson_class_task_submit.save({ transaction: t })

        await t.commit()
        return response.success("Berhasil", res, { id: lesson_class_task_submit.id }, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
