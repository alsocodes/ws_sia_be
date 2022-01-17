const Access = (sequelize, Sequelize) =>
    sequelize.define(
        'access',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            parent_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
                defaultValue: 0
            },
            name: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: true,
            },
            label: {
                type: Sequelize.STRING,
                allowNull: false,
            }

        },
    )

module.exports = Access
