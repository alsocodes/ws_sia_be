const General = (sequelize, Sequelize) =>
    sequelize.define(
        'general',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            name: {
                type: Sequelize.STRING,
                allowNull: false,
            },

            value: {
                type: Sequelize.STRING,
            }
        },
    )

module.exports = General
