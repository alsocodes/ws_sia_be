const student_class = require("../../controllers/sia/activity/student-class");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/student-class", authAccessToken, student_class.get);
    app.get("/sia/activity/student-class-opt", authAccessToken, student_class.getOpt);
    app.post("/sia/activity/student-class", authAccessToken, student_class.create);
    // app.post("/sia/activity/student-class", authAccessToken, student_class.create);
    // app.put("/sia/activity/student-class/:id", authAccessToken, student_class.update);
    app.delete("/sia/activity/student-class/:id", authAccessToken, student_class.del);
    app.get("/sia/activity/student-class/by-class-year", authAccessToken, student_class.getClassYear);
    // app.get("/sia/activity/student-class/:id", authAccessToken, student_class.getOne);
};
