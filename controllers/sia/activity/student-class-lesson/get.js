const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { user } = req
        const { id: lesson_class_id } = req.params // lesson_class_id
        const page = parseInt(!req.query.page ? 1 : req.query.page)
        const page_size = parseInt(!req.query.page_size ? 20 : req.query.page_size)
        const search = !req.query.search ? '' : req.query.search
        const offset = (page - 1) * page_size;
        const limit = page_size;
        const orderby = !req.query.orderby ? 'id' : req.query.orderby
        const order = !req.query.order ? 'desc' : req.query.order
        const filter = !req.query.filter ? {} : JSON.parse(decodeURIComponent(req.query.filter))

        let ordering = [orderby, order];
        if (orderby === 'student.name') {
            console.log('iam here', orderby)
            ordering = [sequelize.literal('student.name'), order];
        } else if (orderby.includes('.')) {
            let od = orderby.split('.')
            let od0 = od[0];
            ordering = [db[od0], od[1], order]
        }
        console.log(orderby)

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

        const student = await db.student.findOne({
            attributes: ['id', 'name'],
            include: {
                model: db.user,
                where: { id: user.id }
            }
        })

        const lesson_class = await db.lesson_class.findOne({
            attributes: ['classroom_id', 'semester_id', 'eduyear_id'],
            where: { id: lesson_class_id }
        })
        const student_class_lessons = await db.lesson_class_student.findAndCountAll({
            attributes: ['id', 'status', 'passed_by', 'passed_at'],
            // required: true,
            include: {
                model: db.lesson_class,
                attributes: [
                    'id', 'status', 'created_at', 'passed_by', 'passed_at'
                ],
                // where: { id: lesson_class_id },
                required: true,
                include: [
                    {
                        model: db.classroom,
                        attributes: ['id', 'code', 'room', 'name'],
                        where: { id: lesson_class.classroom_id }
                    },
                    {
                        model: db.eduyear,
                        attributes: ['id', 'code', 'name'],
                        where: { id: { [Op.eq]: lesson_class.eduyear_id } }
                    },
                    {
                        model: db.semester,
                        attributes: ['id', 'code', 'name'],
                        where: { id: lesson_class.semester_id }
                    },
                    {
                        model: db.lesson,
                        attributes: ['id', 'code', 'name']
                    },
                    {
                        model: db.teacher,
                        attributes: ['id', 'nip', 'name']
                    },
                ],
            },
            where: {
                student_id: student.id,
                // [Op.and]: filterings,
                // [Op.or]: [
                //     { '$classroom.name$': { [Op.like]: '%' + search + '%' } },
                //     { '$eduyear.name$': { [Op.like]: '%' + search + '%' } },
                // ]
            },
            raw: true,
            distinct: true,
            offset: offset,
            limit: limit,
            order: [ordering]
            // order: [[sequelize.literal('student.name'), 'ASC']]
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

        // const student_filterable = await db.student.findAll({
        //     attributes: ['id', 'name'],
        //     include: { model: db.lesson_class, required: true, attributes: [] },
        //     group: ['id', 'name']
        // })
        const result = {
            total_count: student_class_lessons.count,
            total_page: Math.ceil(student_class_lessons.count / page_size),
            rows: student_class_lessons.rows,
            filterable: {
                classroom: classroom_filterable,
                eduyear: eduyear_filterable,
                // student: student_filterable
            },
        }

        return response.success("Get kelas pelajaran siswa sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get kelas pelajaran siswa", res);
    }
};
