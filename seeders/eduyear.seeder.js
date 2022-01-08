const db = require('../models');

const eduyears = [
    { code: '2019', name: '2019/2020', status: 'passed' },
    { code: '2020', name: '2020/2021', status: 'passed' },
    { code: '2021', name: '2021/2022', status: 'active' },
    { code: '2022', name: '2022/2023', status: 'draft' },
]

const create = async (req, res) => {

    await Promise.all(eduyears.map(async (item) => {
        await db.eduyear.create(item)
    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }