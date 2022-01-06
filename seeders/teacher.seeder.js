const db = require('../models');
const bcrypt = require('bcrypt');

const teachers = [{
    nip: '9877890001',
    name: 'Ahmad Zaeni, S.Pdi',
    gender: 'L',
    place_birth: 'Surabaya',
    day_birth: '1985-10-21',
    religion: 'islam',
    address: 'Jl Menanggal Harapn II No 21 Rungkut Surabaya',
    employee_group: '3a',
    position: null,
    last_education: 's1',
    email: 'zaeniahmad@gmail.com',
    phone: '0822123123001',
    entry_year: '2019-12-02',
}, {
    nip: '9877890002',
    name: 'Fitri Rahmawati, S.Pd, M.Pd',
    gender: 'P',
    place_birth: 'Surabaya',
    day_birth: '1990-02-05',
    religion: 'islam',
    address: 'Jl Kutisari Timur 71b Surabaya',
    employee_group: '4a',
    position: 'waka kurikulum',
    last_education: 's2',
    email: 'rahmafit123@gmail.com',
    phone: '0822123123121',
    entry_year: '2016-06-01',
}]

const create = async (req, res) => {

    await Promise.all(teachers.map(async (item) => {

        let user = await db.user.create({
            name: item.name,
            email: item.email,
            password: await bcrypt.hash('123456', 10),
            role_id: 3,
            user_type: 'teacher'
        })

        if (user) {
            item['user_id'] = user.id
            await db.teacher.create(item)
        }

    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }