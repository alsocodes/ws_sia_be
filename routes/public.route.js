const public = require("../controllers/public");

module.exports = (app) => {
    app.get("/public/general", public.getGeneral);
};
