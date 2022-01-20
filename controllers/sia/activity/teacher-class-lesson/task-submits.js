const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.taskSubmits = async (req, res) => {
    try {
        const { task_id, lesson_class_id } = req.params
        const lesson_class_task_submit = await db.lesson_class_student.findAll({
            attributes: [
                'id'
            ],
            include: [
                {
                    model: db.student,
                    attributes: ['id', 'nisn', 'name', 'nis'],
                    include: {
                        required: false,
                        model: db.lesson_class_task_submit,
                        attributes: ['id', 'answer', 'attachment', 'status', 'submitted_at'],
                        where: { lesson_class_task_id: task_id }
                    }
                },
            ],
            where: {
                lesson_class_id: lesson_class_id,
            },
            order: [['id', 'asc']]
        })
        // const lesson_class_tasks = await db.lesson_class_task.findAll({
        //     attributes: [
        //         'id', 'name', 'description', 'attachment', 'status', 'deadline_at', 'open_at', 'close_at', 'created_at'
        //     ],
        //     include:[
        //         {
        //             model: db.lesson_class_student,
        //             attributes:['id'],
        //             include: {
        //                 model: db.student,
        //                 attributes: ['id','nisn','name'],
        //                 include: {
        //                     model: db.lesson_class_task_submit,
        //                     attributes: ['id','answer','attachment', 'status','submitted_at']
        //                 }
        //             }
        //         }
        //     ],
        //     where: {
        //         lesson_class: id,
        //     },
        //     order: [['created_at', 'desc']]
        // })


        return response.success("Get pengumpulan tugas sukses", res, lesson_class_task_submit, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get pengumpulan tugas", res);
    }
};
