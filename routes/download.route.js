const download = require("../controllers/download");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/download-attachment", authAccessToken, download.download);
};
