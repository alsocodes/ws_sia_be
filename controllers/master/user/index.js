const { get } = require("./get");
const { create } = require("./create");
const { update } = require("./update");
const { del } = require("./delete");
const { getOne } = require("./get-one");
const { importData } = require("./import");
const { resetPassword } = require("./reset-password");

module.exports = { get, create, update, del, getOne, importData, resetPassword };
