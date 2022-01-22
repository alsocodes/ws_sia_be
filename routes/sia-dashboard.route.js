const dashboard = require("../controllers/dashboard");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia-dashboard", authAccessToken, dashboard.dashboard);
};
