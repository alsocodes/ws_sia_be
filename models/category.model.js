const Category = (sequelize, Sequelize) =>
    sequelize.define(
        'category',
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
                unique: {
                    args: true,
                    message: 'Category sudah ada'
                }
            },

            slug: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: {
                    args: true,
                    message: 'Slug sudah ada'
                },
            },
            type: {
                type: Sequelize.ENUM('post', 'file'),
                defaultValue: 'post'
            },
            created_by: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            updated_by: {
                type: Sequelize.INTEGER,
                allowNull: true,
            },
            deleted_by: {
                type: Sequelize.INTEGER,
                allowNull: true,
            },

        },
    )

module.exports = Category
