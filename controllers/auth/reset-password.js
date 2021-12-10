const bcrypt = require("bcrypt");
const db = require("../../models");
const helper = require("../../utils/helper");
const mailSender = require("../../utils/mailSender");
const response = require("../../utils/response");
const { Op } = require("sequelize");

exports.resetPassword = async (req, res) => {
  try {

    const reset_token = req.body.reset_token;
    const password = req.body.password;
    const user = await db.token.findOne({
      where: {
        [Op.and]: [
          { token: reset_token },
          { is_active: true },
          {
            expire_at: {
              [Op.gt]: new Date((new Date()).getTime())
            }
          }
        ]
      }
    });

    if (!user) {
      return response.forbidden(
        "Invalid or expired password reeset token",
        res
      );
    }

    const isvalidPassword = helper.checkPassword(password);
    if (!isvalidPassword) {
      return response.error(
        "Invalid password, passwor must at lest 8 character",
        res
      );
    }

    const passHashed = await helper.hashPassword(res, password);
    const updatePassword = await db.user.update(
      { password: passHashed },
      { where: { id: user.user_id } }
    );
    // const sendMail = await mailSender({
    //   from: "ne.nekonako@gmail.com",
    //   to: "code.yuune@gmail.com",
    //   subject: "Request reset password successfully",
    //   text: `Reset password successfully`,
    // });
    const deleteToken = await db.token.update(
      { is_active: false },
      { where: { id: user.id } }
    );


    if (updatePassword && deleteToken) {
      return response.success("Reset password was successfull", res);
    } else {
      return response.error("Reset password is failed", res);
    }
  } catch (err) {
    console.log(err);
    return response.error("Reset password is failed", res);
  }
};
