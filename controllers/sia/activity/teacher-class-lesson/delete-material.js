const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");
const fs = require('fs');
const path = require('path');
const dir_attachment = path.join(__dirname, "../../../../public/attachments/")

exports.deleteMaterial = async (req, res) => {
    const t = await sequelize.transaction();
    let flag;
    try {
        const { lesson_class_id, id } = req.params
        const user = req.user

        const lesson_class_material = await db.lesson_class_material.findOne({ where: { [Op.and]: [{ id: id }, { lesson_class_id: lesson_class_id }] } })
        if (!lesson_class_material) return response.invalidInput("Tidak ditemukan", res)
        if (lesson_class_material.attachment) {
            if (fs.existsSync(dir_attachment + lesson_class_material.attachment)) fs.unlinkSync(dir_attachment + lesson_class_material.attachment)
        }

        lesson_class_material.deleted_by = user.id
        await lesson_class_material.destroy({ transaction: t })

        await t.commit()
        return response.success("Berhasil", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
