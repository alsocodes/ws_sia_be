const lesson = require("../controllers/sia/master/lesson");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/lesson-master", authAccessToken, lesson.get);
    app.post("/sia/lesson-master", authAccessToken, lesson.create);
    app.put("/sia/lesson-master/:id", authAccessToken, lesson.update);
    app.delete("/sia/lesson-master/:id", authAccessToken, lesson.del);
    app.get("/sia/lesson-master/:id", authAccessToken, lesson.getOne);
};
