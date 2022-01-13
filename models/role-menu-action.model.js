const RoleMenuAction = (sequelize, Sequelize) =>
    sequelize.define(
        'role_menu_actions',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },
            sia_menu_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            sia_menu_action_id: {
                type: Sequelize.INTEGER,
                allowNull: false
            },
            role_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
        },
    )

module.exports = RoleMenuAction
