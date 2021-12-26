const Menu = (sequelize, Sequelize) =>
    sequelize.define(
        'menus',
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
            parent_id: {
                type: Sequelize.INTEGER,
                defaultValue: 0,
            },
            post_id: {
                type: Sequelize.INTEGER,
            },
            link: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            target: {
                type: Sequelize.ENUM('self', 'blank', 'parent', 'top'),
                defaultValue: 'parent'
            },
            urut: {
                type: Sequelize.STRING,
            },
            type: {
                type: Sequelize.STRING,
            }

        },
    )

module.exports = Menu
