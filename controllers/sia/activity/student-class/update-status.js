const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.updateStatus = async (req, res) => {
    const t = await sequelize.transaction();
    let flag;
    try {

        const {
            students
        } = req.body

        const user = req.user

        await Promise.all(students.map(async (item) => {
            const {
                status, student_id, student_class_id
            } = item

            const student_class = await db.student_class.findOne({ where: { id: student_class_id, student_id: student_id } })
            if (!student_class) {
                const error = new ("Invalid")
                error.code = 400
                throw error
            }
            student_class.status = status
            if (status === 'passed') {
                student_class.passed_by = user.id
                student_class.passed_at = Sequelize.literal('CURRENT_TIMESTAMP')
            }

            if (status === 'repeat') {
                student_class.repeat_by = user.id
                student_class.repeat_at = Sequelize.literal('CURRENT_TIMESTAMP')
            }

            await student_class.save({ transaction: t })
        }))
        await t.commit()
        return response.success("Berhasil", res, {}, 200);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Gagal", res, flag);
    }
};
