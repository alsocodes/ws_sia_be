const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.createMaterial = async (req, res) => {
    const t = await sequelize.transaction();
    let flag;
    try {

        const {
            name,
            description,
            attachment
        } = req.body

        const { lesson_class_id } = req.params
        const user = req.user

        const create = await db.lesson_class_material.create({
            lesson_class_id: lesson_class_id,
            name: name,
            description: description,
            attachment: attachment,
            created_by: user.id,
            updated_by: user.id,
        }, { transaction: t })

        await t.commit()
        return response.success("Berhasil", res, { id: create.id }, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
