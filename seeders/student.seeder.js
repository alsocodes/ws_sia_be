const db = require('../models');
const bcrypt = require('bcrypt');
const { slugify } = require('../utils/helper');

const students = [{
    nis: '123123001',
    nisn: '321321001',
    name: 'Ahmad Harianto',
    gender: 'l',
    place_birth: 'Surabaya',
    day_birth: '2005-10-01',
    religion: 'islam',
    address: 'Jl Simo gunung rukun 19 RT004 RW003',
    email: 'ahmadharianto@gmail.com',
    phone: '081282810101',
    entry_year: '2021-06-01',
    out_year: null,
    out_reason: null,
    child_no: 1,
    father_name: 'Harianto Supono',
    mother_name: 'Dewi Ratnawati',
    father_job: 'swasta',
    mother_job: 'pedagang',
    father_education: 'sma',
    mother_education: 'sma',
    father_address: 'Jl Simo gunung rukun 19 RT004 RW003',
    mother_address: 'Jl Simo gunung rukun 19 RT004 RW003',
    father_email: 'supono@gmail.com',
    mother_email: 'ratnawati@gmail.com',
    father_phone: '08123456789',
    mother_phone: '08123456789',
    guardian_name: 'Harianto Supono',
    guardian_address: 'Jl Simo gunung rukun 19 RT004 RW003',
    guardian_phone: '08123456789',
    guardian_relation: 'ayah'
}, {
    nis: '123123002',
    nisn: '321321002',
    name: 'Putri Juwita Hapsari',
    gender: 'p',
    place_birth: 'Surabaya',
    day_birth: '2005-09-21',
    religion: 'islam',
    address: 'Jl Klampis Harapan IV No31 Surabaya',
    email: 'pjuwita@gmail.com',
    phone: '0812828101311',
    entry_year: '2021-06-01',
    out_year: null,
    out_reason: null,
    child_no: 1,
    father_name: 'Handoko',
    mother_name: 'Indah Kumalasari',
    father_job: 'pns',
    mother_job: 'swasta',
    father_education: 's1',
    mother_education: 'sma',
    father_address: 'Jl Klampis Harapan IV No31 Surabaya',
    mother_address: 'Jl Klampis Harapan IV No31 Surabaya',
    father_email: 'handoko@gmail.com',
    mother_email: 'indahkumalasari@gmail.com',
    father_phone: '08123456799',
    mother_phone: '08123456799',
    guardian_name: 'Handoko',
    guardian_address: 'Jl Klampis Harapan IV No31 Surabaya',
    guardian_phone: '08123456789',
    guardian_relation: 'ayah'
}]

const create = async (req, res) => {

    await Promise.all(students.map(async (item) => {

        let user = await db.user.create({
            name: item.name,
            email: item.email,
            password: await bcrypt.hash('123456', 10),
            role_id: 2,
            user_type: 'student'
        })

        if (user) {
            item['user_id'] = user.id
            await db.student.create(item)
        }

    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }