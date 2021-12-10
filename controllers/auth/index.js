const { login } = require("./login");
const { forgotPassword } = require("./forgot-password");
const { resetPassword } = require("./reset-password");
const { changePassword } = require("./change-password");
const { refreshToken } = require("./refresh-token");

module.exports = {
  login,
  refreshToken,
  forgotPassword,
  resetPassword,
  changePassword
};
