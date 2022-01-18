const { get } = require("./get");
const { get: getOne } = require("./get-one");
const { get: getStudents } = require("./students");
const { get: getMaterials } = require("./materials");
const { get: getTasks } = require("./tasks");
const { uploadAttachment } = require("./upload");
// const { create } = require("./create");
// const { getOpt } = require("./opt");
// // const { update } = require("./update");
// const { del } = require("./delete");
// const { getClassYear } = require("./get-class-year");

module.exports = { get, getOne, getStudents, getMaterials, getTasks, uploadAttachment };
// module.exports = { get, create, getOpt, del, getClassYear };