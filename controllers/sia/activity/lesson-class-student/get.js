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
        const filter = !req.query.filter ? {} : JSON.parse(decodeURIComponent(req.query.filter))

        let ordering = [orderby, order];

        if (orderby.includes('.')) {
            let od = orderby.split('.')
            let od0 = od[0];
            ordering = [db[od0], od[1], order]
        }

        let filterings = []
        for (var key in filter) {
            let f = filter[key]
            if (f.op === 'equal') filterings.push({ [key]: f.value })
            if (f.op === 'between') {
                let fo = { [key]: { [Op.between]: [f.value.from, f.value.to] } }
                filterings.push(fo)
            }
            if (f.op === 'in') {
                let fo = { [key]: { [Op.in]: f.value } }
                filterings.push(fo)
            }
        }

        const lesson_class_student = await db.lesson_class_student.findAndCountAll({
            attributes: [
                'id', 'status', 'created_at', 'passed_by', 'passed_at'
            ],
            include: [
                {
                    model: db.student,
                    attributes: ['id', 'nisn', 'nis', 'name']
                },
                {
                    model: db.lesson_class,
                    attributes: ['id', 'status'],
                    include: [
                        {
                            model: db.classroom,
                            attributes: ['id', 'code', 'room', 'name']
                        },
                        {
                            model: db.lesson,
                            attributes: ['id', 'code', 'name']
                        },
                        {
                            model: db.eduyear,
                            attributes: ['id', 'code', 'name']
                        },
                        {
                            model: db.semester,
                            attributes: ['id', 'code', 'name']
                        },
                        {
                            model: db.teacher,
                            attributes: ['id', 'nip', 'name']
                        }
                    ]
                }

            ],
            raw: true,

            where: {
                [Op.and]: filterings,
                [Op.or]: [
                    { '$student.name$': { [Op.like]: '%' + search + '%' } },
                    { '$lesson_class.teacher.name$': { [Op.like]: '%' + search + '%' } },
                    { '$lesson_class.lesson.name$': { [Op.like]: '%' + search + '%' } },
                ]
            },
            distinct: true,
            offset: offset,
            limit: limit,
            order: [ordering]
        })

        // const classroom_filterable = await db.classroom.findAll({
        //     attributes: ['id', 'code', 'room', 'name'],
        //     include: { model: db.lesson_class, required: true, attributes: [] },
        //     group: ['id', 'code', 'room', 'name']
        // })

        // const eduyear_filterable = await db.eduyear.findAll({
        //     attributes: ['id', 'code', 'name'],
        //     include: { model: db.lesson_class, required: true, attributes: [] },
        //     group: ['id', 'code', 'name']
        // })

        // const semester_filterable = await db.semester.findAll({
        //     attributes: ['id', 'code', 'name'],
        //     include: { model: db.lesson_class, required: true, attributes: [] },
        //     group: ['id', 'code', 'name']
        // })

        // const lesson_filterable = await db.lesson.findAll({
        //     attributes: ['id', 'code', 'name'],
        //     include: { model: db.lesson_class, required: true, attributes: [] },
        //     group: ['id', 'code', 'name']
        // })

        const result = {
            filterable: {
                classroom: [],
                eduyear: [],
                semester: [],
                teacher: [],
                lesson: [],
            },
            total_count: lesson_class_student.count,
            total_page: Math.ceil(lesson_class_student.count / page_size),
            rows: lesson_class_student.rows,
        }

        return response.success("Get pembelajaran siswa sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get pembelajaran siswa", res);
    }
};
