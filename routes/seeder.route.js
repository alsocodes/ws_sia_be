const { authAccessToken } = require('../middlewares/authToken.middleware');

const student = require("../seeders/student.seeder");
const teacher = require("../seeders/teacher.seeder");
const lesson = require("../seeders/lesson.seeder");
const classroom = require("../seeders/classroom.seeder");
const eduyear = require("../seeders/eduyear.seeder");

module.exports = (app) => {
    app.get("/seed/student", authAccessToken, student.create);
    app.get("/seed/teacher", authAccessToken, teacher.create);
    app.get("/seed/lesson", authAccessToken, lesson.create);
    app.get("/seed/classroom", authAccessToken, classroom.create);
    app.get("/seed/eduyear", authAccessToken, eduyear.create);
};
