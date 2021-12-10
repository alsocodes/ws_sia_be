const db = require("../../models");
const response = require("../../utils/response");
const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
const config = require("../../config/auth.config")
const { Op } = require("sequelize");
const { Sequelize, business } = require("../../models");

exports.login = async (req, res) => {
  try {
    const email = req.body.email;
    const password = req.body.password;

    if (!email || !password) {
      return response.invalidInput(
        "email/username, password cannot be empty",
        res
      );
    }

    let user, accessToken, refreshToken;
    user = await db.user.findOne({
      where: {
        // email: email
        [Op.or]: [{ email: email }, { username: email }],
      },
      include: [
        {
          model: db.role,
          attributes: ['id', 'name']
        }
      ]
    });

    if (!user) {
      return response.forbidden("Wrong Email/Username or password", res);
    }

    const compare = await bcrypt.compare(password, user.password);
    if (!compare) {
      return response.forbidden("Wrong username or password", res);
    }

    accessToken = jwt.sign(
      {
        email: user.email,
        username: user.username,
        id: user.id
      },
      config.accessSecret,
      {
        expiresIn: config.jwtExp,
      }
    );

    refreshToken = jwt.sign(
      {
        email: user.email,
        username: user.username,
        id: user.id
      },
      config.refreshSecret,
      {
        expiresIn: config.jwtRefreshExp,
      }
    );

    res.cookie("token", refreshToken, { httpOnly: true });

    return response.success("Login is successfull", res, {
      access_token: accessToken,
      refresh_token: refreshToken,
      user: {
        name: user.name,
        email: user.email,
        role: user.role,
      }
    }, 200);
  } catch (err) {
    console.log(err);
    return response.error(err.message || "Failed to login", res);
  }
};