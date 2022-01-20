const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_attachment = path.join(__dirname, "../../../../public/attachments/")

const storage = () =>
    multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, dir_attachment);
        },
        filename: (req, file, cb) => {
            cb(
                null,
                file.fieldname + "-" + Date.now() + path.extname(file.originalname)
            );
        },
    });

const attachmentFilter = (req, file, cb) => {
    let ext = path.extname(file.originalname).toLowerCase();
    let alloweds = ['.png', '.jpg', '.jpeg', '.zip', '.rar', '.txt', '.doc', '.docx', '.xls', '.xlsx', '.csv', '.ppt', '.pptx']
    if (!alloweds.includes(ext)) {
        return cb(new Error("Only image, docs, excel, zip, or rar are allowed"));
    }

    cb(null, true);
}

exports.uploadAttachment = async (req, res) => {
    let uploadAttachment = multer({ storage: storage(), fileFilter: attachmentFilter, limits: { fileSize: 500000, }, }).single("attachment")
    uploadAttachment(req, res, async (err) => {
        try {
            if (err) {
                console.log(err)
                return response.invalidInput(err.message, res)
            }

            const { old_attachment } = req.body
            if (old_attachment) {
                if (fs.existsSync(dir_attachment + '/' + old_attachment)) fs.unlinkSync(dir_attachment + '/' + old_attachment)
            }

            return response.success("Upload success", res, { filename: req.file.filename }, 201);
        } catch (err) {
            console.log(err);
            return response.error(err.message || "Failed upload", res);
        }
    })
};