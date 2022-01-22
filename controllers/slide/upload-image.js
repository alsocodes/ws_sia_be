const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
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

exports.uploadImage = async (req, res) => {
    let uploadImage = multer({ storage: storage(), fileFilter: imageFilter, limits: { fileSize: 2000000, }, }).single("slide")
    uploadImage(req, res, async (err) => {
        let sizes = [[600, 349], [1200, 698]]
        try {
            if (req.file) {
                await Promise.all(sizes.map(async (size) => {
                    await sharp(dir_image + '/' + req.file.filename)
                        .resize(size[0], size[1])
                        .jpeg({ quality: 100 })
                        .toFile(dir_image + '/' + size[0] + '-' + req.file.filename);
                }))
            }

            const { old_img } = req.body
            if (old_img) {
                if (fs.existsSync(dir_image + '/' + old_img)) fs.unlinkSync(dir_image + '/' + old_img)
                if (fs.existsSync(dir_image + '/600-' + old_img)) fs.unlinkSync(dir_image + '/600-' + old_img)
                if (fs.existsSync(dir_image + '/1200-' + old_img)) fs.unlinkSync(dir_image + '/1200-' + old_img)
            }

            return response.success("Upload success", res, { filename: req.file.filename }, 201);
        } catch (err) {
            console.log(err);
            return response.error(err.message || "Failed upload", res);
        }
    })
};