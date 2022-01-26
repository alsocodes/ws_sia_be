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
        "Email/Username atau password tidak boleh kosong",
        res
      );
    }

    let user, accessToken, refreshToken;
    user = await db.user.findOne({
      where: {
        // email: email
        [Op.or]: [{ email: email }, { username: email }, { nisn: email }, { nip: email }],
      },
      include: [
        {
          model: db.role,
          attributes: ['id', 'name']
        }
      ]
    });

    if (!user) {
      return response.forbidden("Email/Username atau password salah", res);
    }

    const referer = req.headers.referer
    const dashboard_url = process.env.DASHBOARD_URL
    // console.log(referer, dashboard_url, user.user_type, referer === dashboard_url)
    if ((user.user_type === 'teacher' || user.user_type === 'student') && referer === dashboard_url) {
      return response.success("Anda tidak bisa akses dari Dashboard. Silakan ke Halaman https://sia.smpn33-sby.sch.id", res, { redirect: 'https://sia.smpn33-sby.sch.id' }, 301);
    }

    const compare = await bcrypt.compare(password, user.password);
    if (!compare) {
      return response.forbidden("Email/Username atau password salah", res);
    }

    const raw_access = await db.role_access.findAll({
      raw: true,
      attributes: [],
      include: {
        model: db.access,
        attributes: ['id', 'name']
      },
      where: { role_id: user.role_id }
    })

    const role_access = raw_access.map(item => item['access.name'])

    const last_login = user.current_login
    user.last_login = last_login
    user.current_login = Sequelize.literal("CURRENT_TIMESTAMP")
    await user.save()

    accessToken = jwt.sign(
      {
        email: user.email,
        username: user.username,
        id: user.id,
        role_access: role_access
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
        user_type: user.user_type,
        role_access: role_access,
        last_login: last_login
      },
    }, 200);
  } catch (err) {
    console.log(err);
    return response.error(err.message || "Failed to login", res);
  }
};