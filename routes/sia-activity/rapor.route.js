const rapor = require("../../controllers/sia/activity/rapor");
const { authAccessToken } = require('../../middlewares/authToken.middleware');

module.exports = (app) => {
    app.get("/sia/activity/rapor/form-opt", authAccessToken, rapor.formOpt);
    app.post("/sia/activity/rapor", authAccessToken, rapor.get);
    app.post("/sia/activity/rapor/bulk-upload", authAccessToken, rapor.bulkRaporUpload);
};
