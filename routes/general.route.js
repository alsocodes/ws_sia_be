const general = require("../controllers/setting/general");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/setting/general", authAccessToken, general.get);
    app.post("/setting/general", authAccessToken, general.update);
};
