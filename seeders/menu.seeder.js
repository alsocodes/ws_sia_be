const db = require('../models');

const menus = [
    { name: 'Beranda', parent_id: 0, link: '', urut: '00', type: 'main', target: 'parent' },
    { name: 'Profil', parent_id: 0, link: 'profil-smpn-33-surabaya', urut: '01', type: 'main', target: 'parent' },
    { name: 'Pengumuman', parent_id: 0, link: 'pengumuman', urut: '02', type: 'main', target: 'parent' },
    { name: 'Agenda', parent_id: 0, link: 'agenda', urut: '03', type: 'main', target: 'parent' },
    { name: 'Galeri', parent_id: 0, link: 'galeri', urut: '04', type: 'main', target: 'parent' },
    { name: 'Kontak', parent_id: 0, link: 'kontak', urut: '05', type: 'main', target: 'parent' },
]


const create = async () => {

    await Promise.all(menus.map(async (item) => {
        await db.menu.create(item)
    }))

}

module.exports = { create }