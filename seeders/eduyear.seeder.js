const db = require('../models');

const eduyears = [
    { name: '2019-2020', semester: 'ganjil' },
    { name: '2019-2020', semester: 'genap' },
    { name: '2020-2021', semester: 'ganjil' },
    { name: '2020-2021', semester: 'genap' },
    { name: '2021-2022', semester: 'ganjil' },
    { name: '2021-2022', semester: 'genap' },
]

const create = async (req, res) => {

    await Promise.all(eduyears.map(async (item) => {
        await db.eduyear.create(item)
    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }