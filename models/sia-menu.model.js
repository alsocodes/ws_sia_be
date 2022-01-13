const SiaMenu = (sequelize, Sequelize) =>
    sequelize.define(
        'sia_menus',
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
            },
            parent_id: {
                type: Sequelize.INTEGER,
                defaultValue: 0
            },
            title: {
                type: Sequelize.STRING,
                allowNull: false
            },
            label: {
                type: Sequelize.STRING,
                allowNull: false
            },
            path: {
                type: Sequelize.STRING,
            },
            is_sia: {
                type: Sequelize.BOOLEAN,
                defaultValue: false
            },
            hidden: {
                type: Sequelize.BOOLEAN,
                defaultValue: false
            },
            icon: {
                type: Sequelize.STRING,
            },
            heading: {
                type: Sequelize.STRING,
            },
            devider: {
                type: Sequelize.BOOLEAN,
                defaultValue: false,
            },
            urut: {
                type: Sequelize.STRING,
            },
        },
    )

module.exports = SiaMenu
