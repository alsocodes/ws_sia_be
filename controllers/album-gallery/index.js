// const { uploadImage } = require("./upload-image");
// const { update } = require("./update");
const { getGallery } = require("./get-gallery");
const { getOneGallery } = require("./get-one-gallery");
const { createGallery } = require("./create-gallery");
const { updateGallery } = require("./update-gallery");
const { deleteGallery } = require("./delete-gallery");

const { getAlbum } = require("./get-album");
const { getOneAlbum } = require("./get-one-album");
const { createAlbum } = require("./create-album");
const { updateAlbum } = require("./update-album");
const { deleteAlbum } = require("./delete-album");

const { setAlbumGallery } = require("./set-album-gallery");
const { uploadImage } = require("./upload-image");

module.exports = {
    createGallery, updateGallery, deleteGallery, getGallery, getOneGallery,
    createAlbum, updateAlbum, deleteAlbum, getAlbum, getOneAlbum,
    setAlbumGallery, uploadImage
};
