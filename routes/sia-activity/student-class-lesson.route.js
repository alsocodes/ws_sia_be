const student_class_lesson = require("../../controllers/sia/activity/student-class-lesson");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/one-student-class-lesson", authAccessToken, student_class_lesson.getOneStudent);
    app.get("/sia/activity/student-class-lesson/per-class/:id", authAccessToken, student_class_lesson.get);
    // app.get("/sia/activity/student-class-lesson/:id", authAccessToken, student_class_lesson.getOne);
    // app.get("/sia/activity/student-class-lesson/:id/students", authAccessToken, student_class_lesson.getStudents);

    // app.get("/sia/activity/student-class-lesson/:lesson_class_id/materials", authAccessToken, student_class_lesson.getMaterials);

    // app.get("/sia/activity/student-class-lesson/:lesson_class_id/tasks", authAccessToken, student_class_lesson.getTasks);
    // app.get("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submits", authAccessToken, student_class_lesson.taskSubmits);
    // app.post("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit", authAccessToken, student_class_lesson.taskCreate);
    // app.put("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit/:id", authAccessToken, student_class_lesson.taskUpdate);
    // app.delete("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit/:id", authAccessToken, student_class_lesson.taskDelete);
    // app.post("/sia/activity/student-class-lesson/upload-attachment", authAccessToken, student_class_lesson.uploadAttachment);

};
