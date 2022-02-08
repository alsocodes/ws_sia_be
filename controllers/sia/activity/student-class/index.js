const { get } = require("./get");
const { create } = require("./create");
const { getOpt } = require("./opt");
// const { update } = require("./update");
const { del } = require("./delete");
// const { getOne } = require("./get-one");
const { getClassYear } = require("./get-class-year");
const { updateStatus } = require("./update-status");

module.exports = { get, create, getOpt, del, getClassYear, updateStatus };