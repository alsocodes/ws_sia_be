const lesson_class_student = require("../../controllers/sia/activity/lesson-class-student");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/lesson-class-student-opt", authAccessToken, lesson_class_student.getOpt);
    app.get("/sia/activity/lesson-class-student/by-class-year", authAccessToken, lesson_class_student.getClassYear);
    app.post("/sia/activity/lesson-class-student", authAccessToken, lesson_class_student.create);
    app.get("/sia/activity/lesson-class-student", authAccessToken, lesson_class_student.get);

    // app.get("/sia/activity/lesson-class-student/:id", authAccessToken, lesson_class_student.getOne);
    // app.put("/sia/activity/lesson-class-student/:id", authAccessToken, lesson_class_student.update);
    // app.delete("/sia/activity/lesson-class-student/:id", authAccessToken, lesson_class_student.del);
};
