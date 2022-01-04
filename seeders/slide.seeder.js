const db = require('../models');

const slides = [
    { title: 'Slide ke satu', description: 'slide urutan nomor satu', link: 'link', image: 'slide-1640213972432.jpg', order: '2' },
    { title: 'Slide ke dua', description: 'slide urutan nomor dua', link: 'link', image: 'slide-1640214198882.jpg', order: '1' },
    { title: 'Slide ke tiga', description: 'slide urutan nomor tiga', link: 'link', image: 'slide-1640702067335.jpg', order: '3' },
    { title: 'Slide ke empat', description: 'slide urutan nomor empat', link: 'link', image: 'slide-1640702107825.jpg', order: '0' }
]


const create = async () => {

    await Promise.all(slides.map(async (item) => {
        await db.slide.create(item)
    }))

}

module.exports = { create }