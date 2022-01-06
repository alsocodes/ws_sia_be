const db = require('../models');
const bcrypt = require('bcrypt');

const classrooms = [
    { name: '7', room: 'A' },
    { name: '7', room: 'B' },
    { name: '7', room: 'C' },
    { name: '8', room: 'A' },
    { name: '8', room: 'B' },
    { name: '8', room: 'C' },
    { name: '9', room: 'A' },
    { name: '9', room: 'B' },
    { name: '9', room: 'C' },
]

const create = async (req, res) => {

    await Promise.all(classrooms.map(async (item) => {
        await db.classroom.create(item)
    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }