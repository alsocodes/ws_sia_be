const RoleAccess = (sequelize, Sequelize) =>
    sequelize.define(
        'role_access',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            role_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            access_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            }
        },
    )

module.exports = RoleAccess
