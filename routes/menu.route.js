const menu = require("../controllers/setting/menu");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/setting/menu", authAccessToken, menu.get);
    app.get("/setting/menu/content-opt", authAccessToken, menu.getContentOpt);
    app.post("/setting/menu", authAccessToken, menu.create);
    app.put("/setting/menu/:id", authAccessToken, menu.update);
    app.delete("/setting/menu/:id", authAccessToken, menu.del);
    app.get("/setting/menu-structure", authAccessToken, menu.getStructure);
    app.post("/setting/menu-structure", authAccessToken, menu.updateStructure);
};
