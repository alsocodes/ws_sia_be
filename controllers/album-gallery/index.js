// const { uploadImage } = require("./upload-image");
// const { update } = require("./update");
const { getGallery } = require("./get-gallery");
const { getOneGallery } = require("./get-one-gallery");
const { createGallery } = require("./create-gallery");
const { updateGallery } = require("./update-gallery");
const { deleteGallery } = require("./delete-gallery");

const { getAlbum } = require("./get-Album");
const { getOneAlbum } = require("./get-one-album");
const { createAlbum } = require("./create-Album");
const { updateAlbum } = require("./update-Album");
const { deleteAlbum } = require("./delete-Album");

const { setAlbumGallery } = require("./set-album-gallery");
const { uploadImage } = require("./upload-image");

module.exports = {
    createGallery, updateGallery, deleteGallery, getGallery, getOneGallery,
    createAlbum, updateAlbum, deleteAlbum, getAlbum, getOneAlbum,
    setAlbumGallery, uploadImage
};
