const Graduation = (sequelize, Sequelize) =>
    sequelize.define(
        'graduations',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            eduyear_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            student_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },

            final_score: {
                type: Sequelize.DOUBLE,
                allowNull: false,
                defaultValue: 0.0
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

module.exports = Graduation
