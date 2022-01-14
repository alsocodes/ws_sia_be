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
      return response.forbidden("Wrong Email/Username or password", res);
    }

    const compare = await bcrypt.compare(password, user.password);
    if (!compare) {
      return response.forbidden("Wrong username or password", res);
    }

    // const raw_role_actions = await db.role.findAll({
    //     attributes: ['name'],
    //     // raw:true,
    //     include:[
    //         {
    //             model: db.role_menu_action,
    //             attributes:['id'],
    //             include:[
    //                 {
    //                     model: db.sia_menu,
    //                     attributes:['name','label','title', 'path'],
    //                     include:{
    //                         model: db.sia_menu_action,
    //                         attributes:['id', 'name'],
    //                     },
    //                 }
                    
    //             ]
    //         }
    //     ],
    //     where: {
    //         id: user.role.id
    //     }
    // })

    const raws = await db.sia_menu.findAll({
        attributes:['name','label','title', 'path'],
        include:[
            {
                model: db.sia_menu_action,
                attributes:['id', 'name'],
                include:{
                    model: db.role_menu_action,
                    attributes: [],
                    where: {role_id: user.role.id}
                }
            },
        ]
    })

    // const role_actions = raw_role_actions.map(item=>{
    //     let menu = {}
    //     menu[item.name] = item.name
    //     if(!menu[item.name]['menu']) menu[item.name]['menu']=[]
    //     // menu[item.name]['menu'].push(item['role_menu_actions.sia_menu.name'])
    //     return menu
    // })

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
        // role_actions,
        raws,
        access_token: accessToken,
        refresh_token: refreshToken,
        user: {
            name: user.name,
            email: user.email,
            role: user.role,
        },
    }, 200);
  } catch (err) {
    console.log(err);
    return response.error(err.message || "Failed to login", res);
  }
};