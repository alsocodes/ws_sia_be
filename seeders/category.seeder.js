const db = require('../models');
const bcrypt = require('bcrypt');
const { slugify } = require('../utils/helper');

const create = async () => {
    const slug = slugify('Informasi Penting')
    return await db.category.create({
        name: 'Informasi Penting',
        slug: slug,
        created_by: 1,
        type: 'post'
    });
}

module.exports = { create }