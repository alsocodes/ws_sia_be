const Album = (sequelize, Sequelize) =>
    sequelize.define(
        'albums',
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
            }
        },
    )

module.exports = Album
