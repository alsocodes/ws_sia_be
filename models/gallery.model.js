const Gallery = (sequelize, Sequelize) =>
    sequelize.define(
        'gallery',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            title: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: true,
            },

            description: {
                type: Sequelize.TEXT,
            },

            image: {
                type: Sequelize.STRING,
                allowNull: false
            }
        },
    )

module.exports = Gallery
