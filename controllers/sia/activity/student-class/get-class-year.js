const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getClassYear = async (req, res) => {
    try {

        const {
            classroom_id,
            eduyear_id
        } = req.query

        if (!classroom_id || !eduyear_id) {
            const error = new Error("Kelas tahun ajaran harus diisi");
            error.code = 400;
            throw error
        }

        const student_classes = await db.student_class.findAll({
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
                    model: db.student,
                    attributes: [
                        'id', 'user_id', 'nis', 'nisn', 'name'
                    ]
                },
            ],
            where: {
                [Op.and]: [{ classroom_id: classroom_id }, { eduyear_id: eduyear_id }],
            },
            raw: true
        })



        return response.success("Get sukses", res, student_classes, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res, err.code);
    }
};
