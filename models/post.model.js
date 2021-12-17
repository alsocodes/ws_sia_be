const Post = (sequelize, Sequelize) =>
    sequelize.define(
        'posts',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            title: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            content: {
                type: Sequelize.TEXT,
                allowNull: true,
            },
            excerpt: {
                type: Sequelize.STRING(1000),
            },
            image: {
                type: Sequelize.STRING,
                allowNull: true,
            },
            author: {
                type: Sequelize.STRING,
                allowNull: false,
            },
            type: {
                type: Sequelize.ENUM('post', 'page'),
                allowNull: false,
            },
            status: {
                type: Sequelize.ENUM('publish', 'draft'),
                allowNull: false,
                defaultValue: 'publish',
            },
            visibility: {
                type: Sequelize.ENUM('public', 'private'),
                allowNull: false,
                defaultValue: 'public',
            },

            comment_status: {
                type: Sequelize.ENUM('open', 'close'),
                allowNull: false,
                defaultValue: 'open',
            },
            slug: {
                type: Sequelize.STRING,
                allowNull: false,
                unique: {
                    args: true,
                    message: 'Slug sudah digunakan'
                }
            },
            tags: {
                type: Sequelize.STRING,
                allowNull: true,
            },
            counter: {
                type: Sequelize.INTEGER,
                allowNull: false,
                defaultValue: 0
            },
            sub: {
                type: Sequelize.INTEGER,
                allowNull: true,
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

module.exports = Post
// id
// post_title
// post_content

// post_image
// post_author
//     * post_categories

// post_type
// post_status
// post_visibility

// post_comment_status
// post_slug
// post_tags
// post_counter

// created_by
// updated_by
// deleted_by
// created_at
// updated_at
// deleted_at

// sub_post
// attachment
// restored_at
// restored_by
// is_deleted
