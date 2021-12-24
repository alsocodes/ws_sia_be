// const { getOne } = require("./get-one");
// const { getAll } = require("./get-all");
// const { del } = require("./delete");
// const { uploadImageContent } = require("./upload-image-content");
const { create } = require("./create");
const { uploadImage } = require("./upload-image");
const { update } = require("./update");
const { get } = require("./get");
const { del } = require("./delete");
const { ordering } = require("./ordering");

module.exports = { update, uploadImage, get, create, del, ordering };
