const teacher_class_lesson = require("../../controllers/sia/activity/teacher-class-lesson");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/teacher-class-lesson", authAccessToken, teacher_class_lesson.get);
    app.get("/sia/activity/teacher-class-lesson/:id", authAccessToken, teacher_class_lesson.getOne);
    app.get("/sia/activity/teacher-class-lesson/:id/students", authAccessToken, teacher_class_lesson.getStudents);
    app.get("/sia/activity/teacher-class-lesson/:id/materials", authAccessToken, teacher_class_lesson.getMaterials);
    app.get("/sia/activity/teacher-class-lesson/:id/tasks", authAccessToken, teacher_class_lesson.getTasks);

    app.post("/sia/activity/teacher-class-lesson/upload-attachment", authAccessToken, teacher_class_lesson.uploadAttachment);
    // app.get("/sia/activity/teacher-class-lesson-opt", authAccessToken, teacher_class_lesson.getOpt);
    // app.post("/sia/activity/teacher-class-lesson", authAccessToken, teacher_class_lesson.create);
    // app.post("/sia/activity/teacher-class-lesson", authAccessToken, teacher_class_lesson.create);
    // app.put("/sia/activity/teacher-class-lesson/:id", authAccessToken, teacher_class_lesson.update);
    // app.delete("/sia/activity/teacher-class-lesson/:id", authAccessToken, teacher_class_lesson.del);
    // app.get("/sia/activity/teacher-class-lesson/by-class-year", authAccessToken, teacher_class_lesson.getClassYear);
};
