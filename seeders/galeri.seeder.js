const db = require('../models');

const galleries = [
    { title: 'Galleri 1', description: 'deskripsi galeri satu', image: 'gallery-1640219026794.jpg', type: 'image' },
    { title: 'Galleri 2', description: 'deskripsi galeri dua', image: 'gallery-1641302468757.jpg', type: 'image' },
    { title: 'Galleri 3', description: 'deskripsi galeri tiga', image: '03H1RPOh0Q8', type: 'video' },
    { title: 'Galleri 4', description: 'deskripsi galeri empat', image: 'gallery-1641302378216.jpg', type: 'image' }
]


const create = async () => {

    await Promise.all(galleries.map(async (item) => {
        await db.gallery.create(item)
    }))

}

module.exports = { create }