const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.set = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const {
            semester_id,
            eduyear_id
        } = req.body

        if (!semester_id || !eduyear_id) return response.invalidInput("Tahun dan semester aktif harus diisi")

        const eduyear_check = await db.eduyear.findOne({ where: { status: 'active' } })
        if (!eduyear_check) await db.eduyear.update({ status: 'active' }, { where: { id: eduyear_id }, transaction: t })
        else if (eduyear_check.id !== eduyear_id) {
            eduyear_check.status = 'passed'
            await eduyear_check.save({ transaction: t })
            await db.eduyear.update({ status: 'active' }, { where: { id: eduyear_id }, transaction: t })
        }

        const semester_check = await db.semester.findOne({ where: { status: 'active' } })
        if (!semester_check) await db.semester.update({ status: 'active' }, { where: { id: semester_id }, transaction: t })
        else if (semester_check.id !== semester_id) {
            semester_check.status = 'inactive'
            await semester_check.save({ transaction: t })
            await db.semester.update({ status: 'active' }, { where: { id: semester_id }, transaction: t })
        }
        await t.commit()
        return response.success("Set setting berhasil", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal set setting", res);
    }
};
