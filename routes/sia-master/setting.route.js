const setting = require("../../controllers/sia/master/setting");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/master/setting", authAccessToken, setting.get);
    app.post("/sia/master/setting", authAccessToken, setting.set);
};
