const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.taskSubmit = async (req, res) => {
    try {
        const { task_id, lesson_class_id } = req.params
        const user = req.user
        const student = await db.student.findOne({
            attributes: ['id', 'name'],
            include: {
                model: db.user,
                where: { id: user.id }
            }
        })
        const lesson_class_task_submit = await db.lesson_class_student.findOne({
            attributes: [
                'id'
            ],
            include: [
                {
                    model: db.student,
                    attributes: ['id', 'nisn', 'name', 'nis'],
                    where: { id: student.id },
                    include: {
                        required: false,
                        model: db.lesson_class_task_submit,
                        attributes: [
                            'id', 'answer', 'attachment',
                            [Sequelize.fn('concat', helper.attachmentUrl, Sequelize.col('attachment')), 'attachment_url'],
                            'status', 'submitted_at'
                        ],
                        where: { lesson_class_task_id: task_id }
                    }
                },
            ],
            where: {
                lesson_class_id: lesson_class_id,
            },
            order: [['id', 'asc']]
        })

        return response.success("Get pengumpulan tugas sukses", res, lesson_class_task_submit, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get pengumpulan tugas", res);
    }
};
