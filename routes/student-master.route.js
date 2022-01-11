const student = require("../controllers/sia/master/student");
const { authAccessToken } = require('../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/student-master", authAccessToken, student.get);
    app.post("/sia/student-master", authAccessToken, student.create);
    app.put("/sia/student-master/:id", authAccessToken, student.update);
    app.delete("/sia/student-master/:id", authAccessToken, student.del);
    app.get("/sia/student-master/:id", authAccessToken, student.getOne);
    app.post("/sia/student-master-import", authAccessToken, student.importData);
};
