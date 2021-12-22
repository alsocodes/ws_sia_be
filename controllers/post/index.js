const { create } = require("./create");
const { getOne } = require("./get-one");
const { getAll } = require("./get-all");
const { update } = require("./update");
const { del } = require("./delete");
const { uploadImage } = require("./upload-image");
const { uploadImageContent } = require("./upload-image-content");

module.exports = { create, uploadImage, getOne, getAll, update, del, uploadImageContent };
