const db = require('../models');

const generals = [
    { name: 'site name', value: 'smpn33-sby.sch.id' },
    { name: 'tagline', value: 'Sekolah dengan visi misi masa depan mencetak generasi maju dan unggul, kompetitif dalam persaingan global. Mewujudkan cita-cita bangsa merdeka belajar, merdeka seutuhnya.' },
    { name: 'logo', value: '' },
    { name: 'phone', value: '031-3456789' },
    { name: 'email', value: 'smpn33@gmail.com' },
    { name: 'organization', value: 'SMP Negeri 33 Surabaya' },
    { name: 'address', value: 'Jl. Bukit Darmo Golf No.3, Putat Gede, Kec. Sukomanunggal, Kota SBY, Jawa Timur 60189' },
    { name: 'facebook', value: 'https://facebook.com' },
    { name: 'instagram', value: 'https://instagram.com' },
    { name: 'youtube', value: 'https://youtube.com' },
    { name: 'twitter', value: '' },
]


const create = async () => {
    await Promise.all(generals.map(async (item) => {
        await db.general.create(item)
    }))
}

module.exports = { create }