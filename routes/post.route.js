const post = require("../controllers/post");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.post("/post", authAccessToken, post.create);
    app.get("/post/:id", authAccessToken, post.getOne);
    app.put("/post/:id", authAccessToken, post.update);
    app.get("/post/all/:type", authAccessToken, post.getAll);
    app.delete("/post/:id", authAccessToken, post.del);
    app.post("/post/upload-image", authAccessToken, post.uploadImage);
    app.post("/post/upload-image-content", authAccessToken, post.uploadImageContent);
};
