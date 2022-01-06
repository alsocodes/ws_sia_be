const teacher = require("../controllers/sia/master/teacher");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/teacher-master", authAccessToken, teacher.get);
    app.post("/sia/teacher-master", authAccessToken, teacher.create);
    app.put("/sia/teacher-master/:id", authAccessToken, teacher.update);
    app.delete("/sia/teacher-master/:id", authAccessToken, teacher.del);
    app.get("/sia/teacher-master/:id", authAccessToken, teacher.getOne);
};
