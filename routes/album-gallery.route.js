const albumGallery = require("../controllers/album-gallery");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/gallery", authAccessToken, albumGallery.getGallery);
    app.post("/gallery", authAccessToken, albumGallery.createGallery);
    app.get("/gallery/:id", authAccessToken, albumGallery.getOneGallery);
    app.put("/gallery/:id", authAccessToken, albumGallery.updateGallery);
    app.delete("/gallery/:id", authAccessToken, albumGallery.deleteGallery);

    app.get("/album", authAccessToken, albumGallery.getAlbum);
    app.post("/album", authAccessToken, albumGallery.createAlbum);
    app.get("/album/:id", authAccessToken, albumGallery.getOneAlbum);
    app.put("/album/:id", authAccessToken, albumGallery.updateAlbum);
    app.delete("/album/:id", authAccessToken, albumGallery.deleteAlbum);

    app.post("/set-album-gallery/", authAccessToken, albumGallery.setAlbumGallery);
    app.post("/gallery/upload-image", authAccessToken, albumGallery.uploadImage);
};
