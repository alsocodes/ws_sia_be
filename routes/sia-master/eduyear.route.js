const eduyear = require("../../controllers/sia/master/eduyear");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/master/eduyear", authAccessToken, eduyear.get);
    app.post("/sia/master/eduyear", authAccessToken, eduyear.create);
    app.put("/sia/master/eduyear/:id", authAccessToken, eduyear.update);
    app.delete("/sia/master/eduyear/:id", authAccessToken, eduyear.del);
    app.get("/sia/master/eduyear/:id", authAccessToken, eduyear.getOne);
    // app.post("/sia/master/eduyear-import", authAccessToken, eduyear.create);
};
