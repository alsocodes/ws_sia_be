const slide = require("../controllers/slide");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/slide", authAccessToken, slide.get);
    app.put("/slide", authAccessToken, slide.update);
    app.post("/slide/upload-image", authAccessToken, slide.uploadImage);
};
