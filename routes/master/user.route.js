const user = require("../../controllers/master/user");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/master/user", authAccessToken, user.get);
    app.post("/master/user", authAccessToken, user.create);
    app.put("/master/user/:id", authAccessToken, user.update);
    app.delete("/master/user/:id", authAccessToken, user.del);
    app.get("/master/user/:id", authAccessToken, user.getOne);
    // app.post("/master/user-import", authAccessToken, user.importData);
};
