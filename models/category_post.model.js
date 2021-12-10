const CategoryPost = (sequelize, Sequelize) =>
    sequelize.define(
        'category_post',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            post_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            category_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
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

module.exports = CategoryPost
