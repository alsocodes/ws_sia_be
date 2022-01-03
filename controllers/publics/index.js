const { get: getGeneral } = require("./general");
const { get: getMenus } = require("./menu");
const { get: getSlides } = require("./slide");
const { get: getPosts } = require("./posts");
const { get: getPost } = require("./post");

module.exports = { getGeneral, getMenus, getSlides, getPosts, getPost };
