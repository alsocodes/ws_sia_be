const teacher = require("../../controllers/sia/master/teacher");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/master/teacher", authAccessToken, teacher.get);
    app.post("/sia/master/teacher", authAccessToken, teacher.create);
    app.put("/sia/master/teacher/:id", authAccessToken, teacher.update);
    app.delete("/sia/master/teacher/:id", authAccessToken, teacher.del);
    app.get("/sia/master/teacher/:id", authAccessToken, teacher.getOne);
    app.post("/sia/master/teacher-import", authAccessToken, teacher.importData);
};
