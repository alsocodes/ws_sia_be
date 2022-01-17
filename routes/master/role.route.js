const role = require("../../controllers/master/role");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/master/role", authAccessToken, role.get);
    app.post("/master/role", authAccessToken, role.create);
    app.put("/master/role/:id", authAccessToken, role.update);
    app.delete("/master/role/:id", authAccessToken, role.del);
    app.get("/master/role/access", authAccessToken, role.getAccess);
    app.get("/master/role/:id", authAccessToken, role.getOne);
    // app.post("/master/role-import", authAccessToken, role.importData);
};
