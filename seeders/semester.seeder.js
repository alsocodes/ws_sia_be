const db = require('../models');

const semesters = [
    { code: 'ganjil', name: 'Semester Ganjil', status: 'inactive' },
    { code: 'genap', name: 'Semester Genap', status: 'active' },
]

const create = async (req, res) => {

    await Promise.all(semesters.map(async (item) => {
        await db.semester.create(item)
    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }