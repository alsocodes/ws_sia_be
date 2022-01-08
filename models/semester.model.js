const Semester = (sequelize, Sequelize) =>
    sequelize.define(
        'semesters',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            code: { type: Sequelize.STRING, allowNull: false },
            name: { type: Sequelize.STRING, allowNull: false },
            status: { type: Sequelize.ENUM('inactive', 'active'), defaultValue: 'inactive' }
        },
    )

module.exports = Semester
