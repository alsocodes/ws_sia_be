const db = require('../models');
const bcrypt = require('bcrypt');

const classrooms = [
    { name: 'Kelas 7A', room: 'A', code: 'VII' },
    { name: 'Kelas 7B', room: 'B', code: 'VII' },
    { name: 'Kelas 7C', room: 'C', code: 'VII' },
    { name: 'Kelas 8A', room: 'A', code: 'VIII' },
    { name: 'Kelas 8B', room: 'B', code: 'VIII' },
    { name: 'Kelas 8C', room: 'C', code: 'VIII' },
    { name: 'Kelas 9A', room: 'A', code: 'IX' },
    { name: 'Kelas 9B', room: 'B', code: 'IX' },
    { name: 'Kelas 9C', room: 'C', code: 'IX' },
]

const create = async (req, res) => {

    await Promise.all(classrooms.map(async (item) => {
        await db.classroom.create(item)
    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }