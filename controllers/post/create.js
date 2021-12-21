const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        let title = req.body.title
        const {
            content,
            excerpt,
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


        const user = req.user

        if (!title) {
            return response.invalidInput('Judul tidak boleh kosong', res)
        }
        let check_title = await db.post.findOne({ where: { title: title } })
        if (check_title) {
            title += ' ' + new Date().getTime()
        }
        // if (!categories || categories?.length == 0) {
        //     await rollbackUploaded(uploadeds)
        //     return response.invalidInput('Pilih salah satu kategori', res)
        // }

        let slug = await helper.slugify(title);

        const createPost = await db.post.create({
            title: title,
            slug: slug,
            image: image,
            excerpt: excerpt,
            type: type,
            status: status,
            content: content,
            visibility: visibility,
            comment_status: comment_status,
            tags: tags,
            sub: sub,
            author_id: user.id,
            created_by: user.id
        }, { transaction: t })

        if (createPost) {
            // await Promise.all(categories.map(async (cat) => {
            //     await db.category_post.create({
            //         category_id: cat,
            //         post_id: createPost.id
            //     }, { transaction: t })
            // }))
        }

        await t.commit()

        return response.success("Create post success", res, {
            id: createPost.id
        }, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed create post", res);
    }
};
