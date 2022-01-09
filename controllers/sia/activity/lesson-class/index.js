const { getOpt } = require("./opt");
const { get } = require("./get");
const { create } = require("./create");
const { getOne } = require("./get-one");
const { update } = require("./update");
const { del } = require("./delete");

module.exports = { get, create, getOpt, getOne, update, del };