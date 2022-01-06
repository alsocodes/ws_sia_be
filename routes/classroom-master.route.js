const classroom = require("../controllers/sia/master/classroom");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/classroom-master", authAccessToken, classroom.get);
    app.post("/sia/classroom-master", authAccessToken, classroom.create);
    app.put("/sia/classroom-master/:id", authAccessToken, classroom.update);
    app.delete("/sia/classroom-master/:id", authAccessToken, classroom.del);
    app.get("/sia/classroom-master/:id", authAccessToken, classroom.getOne);
};
