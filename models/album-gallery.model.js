const AlbumGallery = (sequelize, Sequelize) =>
    sequelize.define(
        'album-gallery',
        {
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                allowNull: false,
            },

            album_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
            gallery_id: {
                type: Sequelize.INTEGER,
                allowNull: false,
            },
        },
    )

module.exports = AlbumGallery
