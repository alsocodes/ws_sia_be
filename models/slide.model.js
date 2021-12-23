const Slide = (sequelize, Sequelize) =>
    sequelize.define(
        'slides',
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
                type: Sequelize.STRING(1000),
            },

            link: {
                type: Sequelize.STRING,
            },

            image: {
                type: Sequelize.STRING,
                allowNull: false
            },
            order: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
        },
    )

module.exports = Slide
