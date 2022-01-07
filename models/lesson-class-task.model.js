const LessonClassTask = (sequelize, Sequelize) =>
    sequelize.define(
        'lesson_class_tasks',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            lesson_class_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            name: {
                type: Sequelize.STRING,
                allowNull: false
            },

            description: {
                type: Sequelize.TEXT,
            },

            attachment: {
                type: Sequelize.STRING
            },

            deadline_at: {
                type: Sequelize.DATE,
                allowNull: false
            },

            status: {
                type: Sequelize.ENUM('draft', 'open', 'close'),
                allowNull: false
            },

            open_at: {
                type: Sequelize.DATE,
            },

            close_at: {
                type: Sequelize.DATE,
            }
        },
    )

module.exports = LessonClassTask
