const routes = {};
routes.auth = require('./auth.route');
routes.post = require('./post.route');
routes.slide = require('./slide.route');
routes.albumGallery = require('./album-gallery.route');

module.exports = routes;
