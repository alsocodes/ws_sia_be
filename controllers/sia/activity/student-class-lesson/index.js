const { get } = require("./get");
const { get: getOne } = require("./get-one");
const { get: getStudents } = require("./students");
const { uploadAttachment } = require("./upload");
const { getOneStudent } = require("./one-student");

// tasks
const { get: getTasks } = require("./tasks");
const { taskSubmitCreate } = require("./task-submit-create");
const { taskSubmitUpdate } = require("./task-submit-update");
const { taskSubmitDelete } = require("./task-submit-delete");
const { taskSubmits } = require("./task-submits");

// material
const { get: getMaterials } = require("./materials");
module.exports = {
    get, getOne, getOneStudent,
    getStudents,
    getMaterials,
    getTasks, taskSubmitCreate, taskSubmitUpdate, taskSubmitDelete, taskSubmits,
    uploadAttachment
};
