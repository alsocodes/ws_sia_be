const eduyear = require("../controllers/sia/master/eduyear");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/eduyear-master", authAccessToken, eduyear.get);
    app.post("/sia/eduyear-master", authAccessToken, eduyear.create);
    app.put("/sia/eduyear-master/:id", authAccessToken, eduyear.update);
    app.delete("/sia/eduyear-master/:id", authAccessToken, eduyear.del);
    app.get("/sia/eduyear-master/:id", authAccessToken, eduyear.getOne);
};
