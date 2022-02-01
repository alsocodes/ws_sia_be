const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op, Sequelize } = require("sequelize");
const path = require('path');

exports.get = async (req, res) => {
    try {
        const userLogin = req.user
        const user = await db.user.findOne({ where: { id: userLogin.id } })
        let result = {
            id: user.id,
            name: user.name,
            username: user.username,
            email: user.email,
            photo: user.photo ? `${process.env.IMAGE_URL}${user.photo}` : null
        }
        if (user.user_type === 'teacher') {
            const teacher = await db.teacher.findOne({
                attributes: [
                    'id', 'user_id', 'nip',
                    'name', 'gender', 'place_birth', 'day_birth', 'religion', 'address',
                    'employee_group', 'position', 'last_education',
                    'email', 'phone', 'entry_year', 'created_at'
                ],
                where: { user_id: user.id },
            })
            result['teacher'] = teacher
        }

        if (user.user_type === 'student') {
            const student = await db.student.findOne({
                attributes: [
                    'id', 'user_id', 'nis', 'nisn', 'nik', 'no_akta',
                    'name', 'gender', 'place_birth', 'day_birth',
                    'religion', 'address', 'email', 'phone', 'rt', 'rw', 'urban', 'sub_district', 'city', 'postal_code',
                    'father_name', 'father_job', 'father_education', 'father_email', 'father_phone',
                    'mother_name', 'mother_job', 'mother_education', 'mother_email', 'mother_phone',
                    'guardian_name',
                    'entry_year', 'out_year', 'out_reason',
                    'created_at'
                ],
                include: {
                    required: false,
                    as: 'active_class',
                    model: db.student_class,
                    attributes: ['id', 'status'],
                    where: { status: 'active' },
                    include: {
                        model: db.classroom,
                        attributes: ['id', 'code', 'room', 'name'],
                    }
                },
                where: { user_id: user.id },
            })

            result['student'] = student
        }
        return response.success("success", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Failed", res);
    }
};
