const user = require("../controllers/user");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/user", authAccessToken, user.get);
    app.post("/user", authAccessToken, user.create);
    app.put("/user/:user_id", authAccessToken, user.update);
    app.delete("/user/:user_id", authAccessToken, user.del);
};
