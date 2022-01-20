const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");
const fs = require('fs');
const path = require('path');
const dir_attachment = path.join(__dirname, "../../../../public/attachments/")


exports.taskUpdate = async (req, res) => {
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

        const { lesson_class_id, id } = req.params
        const user = req.user
        const lesson_class_task = await db.lesson_class_task.findOne({
            where: { [Op.and]: [{ id: id }, { lesson_class_id: lesson_class_id }] }
        })
        if (!lesson_class_task) return response.invalidInput("Tidak ditemukan", res)
        if (lesson_class_task.attachment && attachment) {
            if (fs.existsSync(dir_attachment + lesson_class_task.attachment)) fs.unlinkSync(dir_attachment + lesson_class_task.attachment)
        }

        if (status === 'close' && lesson_class_task.status === 'draft') {
            return response.invalidInput("Tugas belum dibuka", res)
        }

        lesson_class_task.name = name;
        lesson_class_task.description = description;
        lesson_class_task.attachment = attachment;
        lesson_class_task.deadline_at = deadline_at;
        lesson_class_task.status = status;
        lesson_class_task.open_at = status === 'open' ? Sequelize.literal('CURRENT_TIMESTAMP') : null
        lesson_class_task.close_at = status === 'close' ? Sequelize.literal('CURRENT_TIMESTAMP') : null

        await lesson_class_task.save({ transaction: t })

        await t.commit()
        return response.success("Berhasil", res, { id: lesson_class_task.id }, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
