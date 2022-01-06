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

        const students = await db.student.findAndCountAll({
            attributes: [
                'id', 'user_id', 'nis', 'nisn',
                'name', 'gender', 'place_birth', 'day_birth',
                'religion', 'address', 'email', 'entry_year', 'out_year', 'out_reason',
                'child_no', 'father_name', 'mother_name', 'father_job', 'mother_job',
                'father_education', 'mother_education', 'father_address',
                'mother_address', 'father_email', 'mother_email', 'father_phone', 'mother_phone',
                'guardian_name', 'guardian_address', 'guardian_phone', 'guardian_relation', 'created_at'
            ],

            where: {
                [Op.or]: [
                    { name: { [Op.like]: '%' + search + '%' } },
                    { nis: { [Op.like]: '%' + search + '%' } },
                    { nisn: { [Op.like]: '%' + search + '%' } },
                    { email: { [Op.like]: '%' + search + '%' } },
                ]
            },
            distinct: true,
            offset: offset,
            limit: limit,
            order: [ordering]
        })

        const result = {
            total_count: students.count,
            total_page: Math.ceil(students.count / page_size),
            rows: students.rows
        }

        return response.success("Get siswa sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get siswa", res);
    }
};
