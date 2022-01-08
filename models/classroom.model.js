const ClassRoom = (sequelize, Sequelize) =>
    sequelize.define(
        'classrooms',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            code: {
                type: Sequelize.STRING,
                allowNull: false,
            },

            room: {
                type: Sequelize.STRING,
                allowNull: false,
            },

            name: {
                type: Sequelize.STRING,
            },

        },
    )

module.exports = ClassRoom
