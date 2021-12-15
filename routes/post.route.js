const post = require("../controllers/post");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.post("/post", authAccessToken, post.create);
    // app.get("/post", authAccessToken, post.get);
    // app.put("/post/:post_id", authAccessToken, post.update);
    // app.delete("/post/:post_id", authAccessToken, post.del);
};
