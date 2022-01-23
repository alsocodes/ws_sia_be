const account = require("../controllers/account");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/account/profile", authAccessToken, account.get);
    app.put("/account/profile/:id", authAccessToken, account.updateProfile);
    app.put("/account/change-password/", authAccessToken, account.changePassword);
};
