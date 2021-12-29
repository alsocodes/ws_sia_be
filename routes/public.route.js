const public = require("../controllers/publics");

module.exports = (app) => {
    app.get("/public/general", public.getGeneral);
    app.get("/public/menus", public.getMenus);
    app.get("/public/slides", public.getSlides);
    app.get("/public/slides", public.getSlides);
};
