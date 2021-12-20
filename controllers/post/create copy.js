const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_image = path.join(__dirname, "../../public/images/")
const dir_attachment = path.join(__dirname, "../../public/attachments/")

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
    let ext = path.extname(file.originalname);
    if (ext !== ".png" && ext !== ".jpg" && ext !== ".jpeg") {
        return cb(new Error("Only image are allowed"));
    }

    cb(null, true);
}

const rollbackUploaded = async (files) => {
    await Promise.all(files.map(async (file) => {
        if (fs.existsSync(file)) {
            //file exists
            fs.unlinkSync(file)
        }
    }))
}

exports.create = async (req, res) => {
    let uploadImage = multer({ storage: storage(), fileFilter: imageFilter, limits: { fileSize: 500000, }, }).single("image")
    uploadImage(req, res, async (err) => {
        const t = await sequelize.transaction();
        let uploadeds = []
        let sizes = [300, 600, 900]
        try {
            const {
                title,
                content,
                image,
                type,
                status,
                visibility,
                comment_status,
                tags,
                attachments,
                sub,
                categories
            } = req.body

            let main_image = '';
            let naming = helper.slugify(title) + '-' + new Date().getTime();
            if (req.file) {
                await Promise.all(sizes.map(async (size) => {
                    let new_filename = naming + '-' + size + path.extname(req.file.filename)
                    await sharp(dir_image + '/' + req.file.filename)
                        .resize(size, size)
                        .jpeg({ quality: 100 })
                        .toFile(dir_image + '/' + new_filename
                        );
                    uploadeds.push(dir_image + '/' + new_filename)
                    if (size === 300) main_image = new_filename
                }))
                fs.rename(req.file.path, dir_image + '/' + naming + path.extname(req.file.filename), (err) => {
                    if (err) throw err;
                });
                uploadeds.push(dir_image + '/' + naming + path.extname(req.file.filename))
                uploadeds.push(req.file.path)
            }
            const user = req.user

            if (!title) {
                await rollbackUploaded(uploadeds)
                return response.invalidInput('Judul tidak boleh kosong', res)
            }
            if (!categories || categories?.length == 0) {
                await rollbackUploaded(uploadeds)
                return response.invalidInput('Pilih salah satu kategori', res)
            }

            const slug = await helper.slugify(title);

            const createPost = await db.post.create({
                title: title,
                slug: slug,
                image: main_image,
                type: type,
                status: status,
                content: content,
                visibility: visibility,
                comment_status: comment_status,
                tags: tags,
                sub: sub,
                author: user.id,
                created_by: user.id
            }, { transaction: t })

            if (createPost) {
                await Promise.all(categories.map(async (cat) => {
                    await db.category_post.create({
                        category_id: cat,
                        post_id: createPost.id
                    }, { transaction: t })
                }))
            }

            await t.commit()

            return response.success("Create post success", res, {
                public_id: createPost.id
            }, 201);
        } catch (err) {
            console.log(err);
            await t.rollback()
            // unlink
            await rollbackUploaded(uploadeds)
            return response.error(err.message || "Failed create post", res);
        }
    })
};
