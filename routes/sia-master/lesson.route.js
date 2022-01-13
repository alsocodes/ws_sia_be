const lesson = require("../../controllers/sia/master/lesson");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/master/lesson", authAccessToken, lesson.get);
    app.post("/sia/master/lesson", authAccessToken, lesson.create);
    app.put("/sia/master/lesson/:id", authAccessToken, lesson.update);
    app.delete("/sia/master/lesson/:id", authAccessToken, lesson.del);
    app.get("/sia/master/lesson/:id", authAccessToken, lesson.getOne);
    app.post("/sia/master/lesson-import", authAccessToken, lesson.importData);
};
