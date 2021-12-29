const PostMeta = (sequelize, Sequelize) =>
    sequelize.define(
        'post_meta',
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
            name: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            value: {
                type: Sequelize.TEXT,
            },
        },
    )

module.exports = PostMeta