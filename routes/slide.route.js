const slide = require("../controllers/slide");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.post("/slide", authAccessToken, slide.create);
    app.post("/slide/ordering", authAccessToken, slide.ordering);
    app.get("/slide", authAccessToken, slide.get);
    app.put("/slide/:id", authAccessToken, slide.update);
    app.delete("/slide/:id", authAccessToken, slide.del);
    app.post("/slide/upload-image", authAccessToken, slide.uploadImage);
};
