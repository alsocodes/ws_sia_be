const bcrypt = require("bcrypt");
const db = require("../../models");
const helper = require("../../utils/helper");
const mailSender = require("../../utils/mailSender");
const response = require("../../utils/response");
const config = require("../../config/auth.config")
const jwt = require('jsonwebtoken')

exports.changePassword = async (req, res) => {
  try {

    const old_password = req.body.old_password;
    const new_password = req.body.new_password;

    const user = await db.user.findOne({
      where: {
        public_id: req.user.public_id
      }
    });

    if (!user) {
      return response.forbidden(
        "Invalid user",
        res
      );
    }

    const compare = await bcrypt.compare(old_password, user.password);
    if (!compare) {
      return response.forbidden("Wrong old password", res);
    }

    const isvalidPassword = helper.checkPassword(new_password);
    if (!isvalidPassword) {
      return response.error(
        "Invalid password, password must at lest 8 character",
        res
      );
    }

    const passHashed = await helper.hashPassword(res, new_password);
    const updatePassword = await db.user.update(
      { password: passHashed },
      { where: { id: user.id } }
    );

    let accessToken = jwt.sign(
      {
        id: user.id,
        email: user.email,
        phone_number: user.phone_number,
        role_id: user.role_id
      },
      config.accessSecret,
      {
        expiresIn: config.jwtExp,
      }
    );

    let refreshToken = jwt.sign(
      {
        id: user.id,
        email: user.email,
        phone_number: user.phone_number,
        role_id: user.role_id
      },
      config.refreshSecret,
      {
        expiresIn: config.jwtRefreshExp,
      }
    );


    if (updatePassword && accessToken && refreshToken) {
      return response.success("Reset password was successfull", res, {
        access_token: accessToken,
        refresh_token: refreshToken,
      });
    } else {
      return response.error("Reset password is failed", res);
    }
  } catch (err) {
    console.log(err);
    return response.error("Change password is failed", res);
  }
};
