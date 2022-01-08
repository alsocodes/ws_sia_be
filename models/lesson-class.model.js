const LessonClass = (sequelize, Sequelize) =>
    sequelize.define(
        'lesson_classs',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            classroom_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            eduyear_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            lesson_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            teacher_id: {
                type: Sequelize.INTEGER,
            },

            semester_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            status: {
                type: Sequelize.ENUM('active', 'passed'),
                allowNull: false,
                defaultValue: 'active'
            },
            passed_at: {
                type: Sequelize.DATE
            },
            passed_by: {
                type: Sequelize.INTEGER,
            },
            created_by: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            updated_by: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            deleted_by: {
                type: Sequelize.INTEGER,
            }
        },
    )

module.exports = LessonClass
