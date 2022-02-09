const graduation = require("../../controllers/sia/activity/graduation");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/graduation/form-opt", authAccessToken, graduation.formOpt);
    app.post("/sia/activity/graduation", authAccessToken, graduation.get);
    app.post("/sia/activity/graduation/bulk-upload", authAccessToken, graduation.bulkGraduationUpload);
    app.put("/sia/activity/graduation", authAccessToken, graduation.update);
};
