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

            name: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: true,
            },
            description: {
                type: Sequelize.STRING,
            }

        },
    )

module.exports = Access
