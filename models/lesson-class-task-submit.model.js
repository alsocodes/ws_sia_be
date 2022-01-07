const LessonClassTaskSubmit = (sequelize, Sequelize) =>
    sequelize.define(
        'lesson_class_task_submits',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            lesson_class_task_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            student_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },

            answer: {
                type: Sequelize.TEXT,
            },

            attachment: {
                type: Sequelize.STRING,
            },

            status: {
                type: Sequelize.ENUM('draft', 'submit')
            },

            submitted_at: {
                type: Sequelize.DATE
            }

        },
    )

module.exports = LessonClassTaskSubmit
