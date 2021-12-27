const public = require("../controllers/public/index.js");

module.exports = (app) => {
    app.get("/public/general", public.getGeneral);
};
