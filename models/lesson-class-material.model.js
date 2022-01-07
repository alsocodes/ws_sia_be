const LessonClassMaterial = (sequelize, Sequelize) =>
    sequelize.define(
        'lesson_class_materials',
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

module.exports = LessonClassMaterial
