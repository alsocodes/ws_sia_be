const { get } = require("./get");
const { create } = require("./create");
const { update } = require("./update");
const { del } = require("./delete");
const { getStructure } = require("./get-structure");
const { updateStructure } = require("./update-structure");

module.exports = { create, get, update, del, getStructure, updateStructure };
