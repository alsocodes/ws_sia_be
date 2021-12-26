const routes = {};
routes.auth = require('./auth.route');
routes.post = require('./post.route');
routes.slide = require('./slide.route');
routes.albumGallery = require('./album-gallery.route');
routes.general = require('./general.route');
routes.menu = require('./menu.route');
routes.public = require('./public.route');

module.exports = routes;
