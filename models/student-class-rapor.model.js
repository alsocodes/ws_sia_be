const StudentClassRapor = (sequelize, Sequelize) =>
    sequelize.define(
        'student_class_rapors',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            student_class_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            semester_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            file: {
                type: Sequelize.STRING,
                allowNull: false
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

module.exports = StudentClassRapor
