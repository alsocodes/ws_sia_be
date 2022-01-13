const classroom = require("../../controllers/sia/master/classroom");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/master/classroom", authAccessToken, classroom.get);
    app.post("/sia/master/classroom", authAccessToken, classroom.create);
    app.put("/sia/master/classroom/:id", authAccessToken, classroom.update);
    app.delete("/sia/master/classroom/:id", authAccessToken, classroom.del);
    app.get("/sia/master/classroom/:id", authAccessToken, classroom.getOne);
    app.post("/sia/master/classroom-import", authAccessToken, classroom.importData);
};
