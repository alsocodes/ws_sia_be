const public = require("../controllers/publics");

module.exports = (app) => {
    app.get("/public/general", public.getGeneral);
};
