const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getClassYear = async (req, res) => {
    try {

        const {
            classroom_id,
            eduyear_id,
            semester_id
        } = req.query

        if (!classroom_id || !eduyear_id || !semester_id) {
            const error = new Error("Kelas, tahun ajaran, dan semester harus diisi");
            error.code = 400;
            throw error
        }

        const lesson_classes = await db.lesson_class.findAll({
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
                    model: db.semester,
                    attributes: ['id', 'code', 'name']
                },
                {
                    model: db.teacher,
                    attributes: ['id', 'nip', 'nik', 'name']
                },
                {
                    model: db.lesson,
                    attributes: [
                        'id', 'code', 'name'
                    ]
                },
            ],
            where: {
                [Op.and]: [{ classroom_id: classroom_id }, { eduyear_id: eduyear_id }, { semester_id: semester_id }],
            },
            raw: true
        })

        const classroom = await db.classroom.findOne({ where: { id: classroom_id } })

        let where_lesson_class = {}
        let where_class = {}
        let req_lesson_class = false
        let req_class = false
        let where_where = {}
        if (classroom.code === 'VII') {
            where_where = {
                [Op.or]: [
                    { '$lesson_classes.classroom.code$': { [Op.notIn]: ['VII', 'VII', 'IX'] } },
                    { '$lesson_classes.classroom.code$': null },
                ]
            }
        }

        if (classroom.code === 'VIII') {
            where_where = {
                [Op.and]: [
                    { '$lesson_classes.classroom.code$': 'VII' },
                    { '$lesson_classes.status$': 'passed' }
                ]
            }
        }

        if (classroom.code === 'IX') {
            where_where = {
                [Op.and]: [
                    { '$lesson_classes.classroom.code$': 'VIII' },
                    { '$lesson_classes.status$': 'passed' }
                ]
            }
        }


        const calons = await db.lesson.findAll({
            attributes: ['id', 'code', 'name'],
            raw: true,
            include: [
                {
                    required: false,
                    model: db.lesson_class,
                    attributes: ['id', 'status'],
                    where: {
                        [Op.and]: [{ classroom_id: { [Op.ne]: classroom_id } }, { eduyear_id: { [Op.ne]: eduyear_id } }, { semester_id: { [Op.ne]: semester_id } }]
                    }
                }
            ],
            //where: where_where
        })


        return response.success("Get sukses", res, { calon_peserta: calons, peserta: lesson_classes }, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res, err.code);
    }
};
