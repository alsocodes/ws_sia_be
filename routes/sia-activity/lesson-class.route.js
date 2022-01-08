const lesson_class = require("../../controllers/sia/activity/lesson-class");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/lesson-class", authAccessToken, lesson_class.get);
    app.post("/sia/activity/lesson-class", authAccessToken, lesson_class.create);
    // app.put("/sia/activity/lesson-class/:id", authAccessToken, lesson_class.update);
    // app.delete("/sia/activity/lesson-class/:id", authAccessToken, lesson_class.del);
    // app.get("/sia/activity/lesson-class/:id", authAccessToken, lesson_class.getOne);
};
