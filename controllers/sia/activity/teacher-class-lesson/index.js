const { get } = require("./get");
const { get: getOne } = require("./get-one");
const { get: getStudents } = require("./students");
const { uploadAttachment } = require("./upload");

// tasks
const { get: getTasks } = require("./tasks");
const { taskCreate } = require("./task-create");
const { taskUpdate } = require("./task-update");
const { taskDelete } = require("./task-delete");
const { taskSubmits } = require("./task-submits");


// material
const { get: getMaterials } = require("./materials");
const { createMaterial } = require("./create-material");
const { updateMaterial } = require("./update-material");
const { deleteMaterial } = require("./delete-material");

// const { getOpt } = require("./opt");
// // const { update } = require("./update");
// const { del } = require("./delete");
// const { getClassYear } = require("./get-class-year");

module.exports = {
    get, getOne,
    getStudents,
    getMaterials, createMaterial, updateMaterial, deleteMaterial,
    getTasks, taskCreate, taskUpdate, taskDelete, taskSubmits,
    uploadAttachment
};
