const Lesson = (sequelize, Sequelize) =>
    sequelize.define(
        'lessons',
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

module.exports = Lesson
