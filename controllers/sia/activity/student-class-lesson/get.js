const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.get = async (req, res) => {
    try {
        const { user } = req
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

        const { classroom_id, eduyear_id, semester_id } = req.params // lesson_class_id
        const student_class_lessons = await db.lesson_class_student.findAll({
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
                        where: { id: classroom_id }
                    },
                    {
                        model: db.eduyear,
                        attributes: ['id', 'code', 'name'],
                        where: { id: { [Op.eq]: eduyear_id } }
                    },
                    {
                        model: db.semester,
                        attributes: ['id', 'code', 'name'],
                        where: { id: semester_id }
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
                [Op.or]: [
                    { '$lesson_class.teacher.name$': { [Op.like]: '%' + search + '%' } },
                    { '$lesson_class.lesson.name$': { [Op.like]: '%' + search + '%' } },
                ]
            },
            raw: true,
        })

        return response.success("Get kelas pelajaran siswa sukses", res, student_class_lessons, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get kelas pelajaran siswa", res);
    }
};
