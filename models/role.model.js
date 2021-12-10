const Role = (sequelize, Sequelize) =>
    sequelize.define(
        'roles',
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

        },
    )

module.exports = Role
