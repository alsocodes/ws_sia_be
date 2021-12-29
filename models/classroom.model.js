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
        
            name: {
                type: Sequelize.STRING,
                allowNull: false,
            },

            description: {
                type: Sequelize.STRING(1000),
            }
        },
    )

module.exports = ClassRoom
