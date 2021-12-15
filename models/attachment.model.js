const Attachment = (sequelize, Sequelize) =>
    sequelize.define(
        'attachment',
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

            file: {
                type: Sequelize.STRING,
                allowNull: false,
            }
        },
    )

module.exports = Attachment
