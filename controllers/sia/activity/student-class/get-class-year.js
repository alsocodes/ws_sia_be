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

        const classroom = await db.classroom.findOne({ where: { id: classroom_id } })

        let where_student_class = {}
        let where_class = {}
        let req_student_class = false
        let req_class = false
        let where_where = {}
        if (classroom.code === 'VII') {
            where_where = {
                [Op.or]: [
                    { '$student_classes.classroom.code$': { [Op.ne]: 'VII' } },
                    { '$student_classes.classroom.code$': null },
                ]
            }
        }

        if (classroom.code === 'VIII') {
            where_where = {
                [Op.and]: [
                    { '$student_classes.classroom.code$': 'VII' },
                    { '$student_classes.status$': 'passed' }
                ]
            }
        }

        if (classroom.code === 'IX') {
            where_where = {
                [Op.and]: [
                    { '$student_classes.classroom.code$': 'VIII' },
                    { '$student_classes.status$': 'passed' }
                ]
            }
        }


        const calons = await db.student.findAll({
            attributes: ['id', 'name', 'nis', 'nisn'],
            raw: true,
            include: [
                {
                    model: db.student_class,
                    attributes: ['id', 'status'],
                    include: {
                        model: db.classroom,
                        attributes: ['id', 'code'],
                    }
                }
            ],
            where: where_where
        })


        return response.success("Get sukses", res, { calon_peserta: calons, peserta: student_classes }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res, err.code);
    }
};
