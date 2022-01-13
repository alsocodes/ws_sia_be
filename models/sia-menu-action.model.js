const SiaMenuAction = (sequelize, Sequelize) =>
    sequelize.define(
        'sia_menu_actions',
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
            name: {
                type: Sequelize.STRING,
                allowNull: false,
            },
        },
    )

module.exports = SiaMenuAction
