const db = require('../models');
const bcrypt = require('bcrypt');

const lessons = [
    { code: 'mtk', name: 'Matematika' },
    { code: 'bind', name: 'Bahasa Indonesa' },
    { code: 'bing', name: 'Bahasa Inggris' },
    { code: 'fis', name: 'Fisika' },
    { code: 'kim', name: 'Kimia' },
    { code: 'org', name: 'Olahraga' },
    { code: 'kes', name: 'Kesenian' },
    { code: 'pai', name: 'Pendidikan Agama Islam' },
    { code: 'kkpi', name: 'Ketrampilan Komputer dan Pengolahan Informasi' },
]

const create = async (req, res) => {

    await Promise.all(lessons.map(async (item) => {
        await db.lesson.create(item)
    }))

    res.send({ success: true, message: 'okek' })
}

module.exports = { create }