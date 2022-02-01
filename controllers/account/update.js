const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_image = path.join(__dirname, "../../public/images/")

const storage = () =>
    multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, dir_image);
        },
        filename: (req, file, cb) => {
            cb(
                null,
                file.fieldname + "-" + Date.now() + path.extname(file.originalname)
            );
        },
    });

const imageFilter = (req, file, cb) => {
    let ext = path.extname(file.originalname).toLowerCase();
    if (ext !== ".png" && ext !== ".jpg" && ext !== ".jpeg") {
        return cb(new Error("Only image are allowed"));
    }

    cb(null, true);
}


exports.updateProfile = async (req, res) => {
    let uploadImage = multer({ storage: storage(), fileFilter: imageFilter, limits: { fileSize: 1000000, }, }).single("photo")
    uploadImage(req, res, async (err) => {
        const t = await sequelize.transaction();
        try {
            if (req.file) {
                await sharp(dir_image + '/' + req.file.filename)
                    .resize(100, 100)
                    .jpeg({ quality: 100 })
                    .toFile(dir_image + '/' + 100 + '-' + req.file.filename);

                const {
                    name,
                    username,
                    email
                } = req.body
                const { id } = req.params
                const check = await db.user.findOne({ where: { email: email, id: { [Op.ne]: id } } })
                if (check) return response.invalidInput("Email sudah digunakan", res)
                const check_username = await db.user.findOne({ where: { username: username, id: { [Op.ne]: id } } })
                if (check_username) return response.invalidInput("Username sudah digunakan", res)
                const user = await db.user.findOne({ where: { id: id } })

                const old_photo = user.photo
                user.name = name
                user.username = username
                user.email = email
                user.photo = req.file.filename
                await user.save({ transaction: t })

                await t.commit()
                if (old_photo) {
                    if (fs.existsSync(dir_image + '/' + old_photo)) fs.unlinkSync(dir_image + '/' + old_photo)
                    if (fs.existsSync(dir_image + '/100-' + old_photo)) fs.unlinkSync(dir_image + '/100-' + old_photo)
                }
                return response.success("Berhasil", res, {}, 200);
            } else {
                return response.error("Error", res);
            }
        } catch (err) {
            console.log(err);
            await t.rollback()
            return response.error(err.message || "Failed", res);
        }
    })
};
