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
            classroom_id,
            students
        } = req.body

        const user = req.user

        let classroom = null
        if (classroom_id) classroom = await db.classroom.findOne({ where: { id: classroom_id } })
        const eduyear = await db.eduyear.findOne({ where: { status: 'active' } })

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
                if (classroom) {
                    if (eduyear.id === student_class.eduyear_id) {
                        const err = new Error("Tahun ajaran baru belum diatur", res)
                        err.code = 400
                        throw err
                    }

                    await db.student_class.create({
                        classroom_id: classroom.id,
                        eduyear_id: eduyear.id,
                        student_id: student_id,
                        created_by: user.id,
                        updated_by: user.id,
                    }, { transaction: t })
                }
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
