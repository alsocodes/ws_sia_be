const student = require("../../controllers/sia/master/student");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/master/student", authAccessToken, student.get);
    app.post("/sia/master/student", authAccessToken, student.create);
    app.put("/sia/master/student/:id", authAccessToken, student.update);
    app.delete("/sia/master/student/:id", authAccessToken, student.del);
    app.get("/sia/master/student/:id", authAccessToken, student.getOne);
    app.post("/sia/master/student-import", authAccessToken, student.importData);
};
