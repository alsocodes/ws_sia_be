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
            code: { type: Sequelize.STRING, allowNull: false },
            name: { type: Sequelize.STRING, allowNull: false }
        },
    )

module.exports = Lesson
