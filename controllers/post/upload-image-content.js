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

exports.uploadImageContent = async (req, res) => {
    let uploadImage = multer({ storage: storage(), fileFilter: imageFilter, limits: { fileSize: 500000, }, }).single("img")

    uploadImage(req, res, async (err) => {
        try {
            let url_upload = process.env.BASE_URL_API + '/public/images/'

            return response.success("Upload success", res, { location: url_upload + req.file.filename }, 201);
        } catch (err) {
            console.log(err);
            return response.error(err.message || "Failed upload", res);
        }
    })
};