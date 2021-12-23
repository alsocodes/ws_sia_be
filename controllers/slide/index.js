// const { create } = require("./create");
// const { getOne } = require("./get-one");
// const { getAll } = require("./get-all");
// const { del } = require("./delete");
// const { uploadImageContent } = require("./upload-image-content");
const { uploadImage } = require("./upload-image");
const { update } = require("./update");
const { get } = require("./get");

module.exports = { update, uploadImage, get };
