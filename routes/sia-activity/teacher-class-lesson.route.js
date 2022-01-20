const teacher_class_lesson = require("../../controllers/sia/activity/teacher-class-lesson");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/teacher-class-lesson", authAccessToken, teacher_class_lesson.get);
    app.get("/sia/activity/teacher-class-lesson/:id", authAccessToken, teacher_class_lesson.getOne);
    app.get("/sia/activity/teacher-class-lesson/:id/students", authAccessToken, teacher_class_lesson.getStudents);

    app.get("/sia/activity/teacher-class-lesson/:lesson_class_id/materials", authAccessToken, teacher_class_lesson.getMaterials);
    app.post("/sia/activity/teacher-class-lesson/:lesson_class_id/material", authAccessToken, teacher_class_lesson.createMaterial);
    app.put("/sia/activity/teacher-class-lesson/:lesson_class_id/material/:id", authAccessToken, teacher_class_lesson.updateMaterial);
    app.delete("/sia/activity/teacher-class-lesson/:lesson_class_id/material/:id", authAccessToken, teacher_class_lesson.deleteMaterial);

    app.get("/sia/activity/teacher-class-lesson/:lesson_class_id/tasks", authAccessToken, teacher_class_lesson.getTasks);
    app.post("/sia/activity/teacher-class-lesson/:lesson_class_id/task", authAccessToken, teacher_class_lesson.taskCreate);
    app.put("/sia/activity/teacher-class-lesson/:lesson_class_id/task/:id", authAccessToken, teacher_class_lesson.taskUpdate);
    app.delete("/sia/activity/teacher-class-lesson/:lesson_class_id/task/:id", authAccessToken, teacher_class_lesson.taskDelete);
    app.get("/sia/activity/teacher-class-lesson/:lesson_class_id/task/:task_id/submits", authAccessToken, teacher_class_lesson.taskSubmits);
    app.post("/sia/activity/teacher-class-lesson/upload-attachment", authAccessToken, teacher_class_lesson.uploadAttachment);

};
