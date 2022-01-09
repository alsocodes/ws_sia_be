const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {

        const page = parseInt(!req.query.page ? 1 : req.query.page)
        const page_size = parseInt(!req.query.page_size ? 20 : req.query.page_size)
        const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;
        const orderby = !req.query.orderby ? 'id' : req.query.orderby
        const order = !req.query.order ? 'desc' : req.query.order

        let ordering = [orderby, order];

        if (orderby.includes('.')) {
            let od = orderby.split('.')
            let od0 = od[0];
            ordering = [db[od0], od[1], order]
        }

        const lesson_classes = await db.lesson_class.findAndCountAll({
            attributes: [
                'id', 'status', 'created_at', 'passed_by', 'passed_at'
            ],
            include: [
                {
                    model: db.classroom,
                    attributes: ['id', 'code', 'room', 'name']
                },
                {
                    model: db.eduyear,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.lesson,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.teacher,
                    attributes: ['id', 'nip', 'name']
                },
                {
                    model: db.semester,
                    attributes: ['id', 'code', 'name']
                }
            ],
            raw: true,

            where: {
                [Op.or]: [
                    { '$classroom.name$': { [Op.like]: '%' + search + '%' } },
                    { '$eduyear.name$': { [Op.like]: '%' + search + '%' } },
                    { '$semester.name$': { [Op.like]: '%' + search + '%' } },
                    { '$teacher.name$': { [Op.like]: '%' + search + '%' } },
                    { '$lesson.name$': { [Op.like]: '%' + search + '%' } },
                ]
            },
            distinct: true,
            offset: offset,
            limit: limit,
            order: [ordering]
        })

        const classroom_filterable = await db.classroom.findAll({
            attributes: ['id', 'code', 'room', 'name'],
            include: { model: db.lesson_class, required: true, attributes: [] },
            group: ['id', 'code', 'room', 'name']
        })

        const eduyear_filterable = await db.eduyear.findAll({
            attributes: ['id', 'code', 'name'],
            include: { model: db.lesson_class, required: true, attributes: [] },
            group: ['id', 'code', 'name']
        })

        const semester_filterable = await db.semester.findAll({
            attributes: ['id', 'code', 'name'],
            include: { model: db.lesson_class, required: true, attributes: [] },
            group: ['id', 'code', 'name']
        })

        const teacher_filterable = await db.teacher.findAll({
            attributes: ['id', 'nip', 'name'],
            include: { model: db.lesson_class, required: true, attributes: [] },
            group: ['id', 'nip', 'name']
        })

        const lesson_filterable = await db.lesson.findAll({
            attributes: ['id', 'code', 'name'],
            include: { model: db.lesson_class, required: true, attributes: [] },
            group: ['id', 'code', 'name']
        })

        const result = {
            filterable: {
                classroom: classroom_filterable,
                eduyear: eduyear_filterable,
                semester: semester_filterable,
                teacher: teacher_filterable,
                lesson: lesson_filterable,
            },
            total_count: lesson_classes.count,
            total_page: Math.ceil(lesson_classes.count / page_size),
            rows: lesson_classes.rows,
        }

        return response.success("Get pembelajaran kelas sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get pembelajaran kelas", res);
    }
};
