const student_class_lesson = require("../../controllers/sia/activity/student-class-lesson");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/one-student-class-lesson", authAccessToken, student_class_lesson.getOneStudent);
    app.get("/sia/activity/student-class-lesson/classroom/:classroom_id/eduyear/:eduyear_id/semester/:semester_id", authAccessToken, student_class_lesson.get);
    app.get("/sia/activity/student-class-lesson/:id", authAccessToken, student_class_lesson.getOne);
    app.get("/sia/activity/student-class-lesson/:id/students", authAccessToken, student_class_lesson.getStudents);

    app.get("/sia/activity/student-class-lesson/:lesson_class_id/materials", authAccessToken, student_class_lesson.getMaterials);

    app.get("/sia/activity/student-class-lesson/:lesson_class_id/tasks", authAccessToken, student_class_lesson.getTasks);
    app.get("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit", authAccessToken, student_class_lesson.taskSubmit);
    app.post("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit", authAccessToken, student_class_lesson.taskSubmitCreate);
    app.put("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit/:id", authAccessToken, student_class_lesson.taskSubmitUpdate);
    app.post("/sia/activity/student-class-lesson/upload-attachment", authAccessToken, student_class_lesson.uploadAttachment);
    // app.delete("/sia/activity/student-class-lesson/:lesson_class_id/task/:task_id/submit/:id", authAccessToken, student_class_lesson.taskDelete);

};
