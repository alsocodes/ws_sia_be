const db = require("../../models");
const helper = require("../../utils/helper");
const response = require("../../utils/response");
const sequelize = require('../../models').sequelize;
const { Op } = require("sequelize");

exports.update = async (req, res) => {
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

        const { id } = req.params
        const post = await db.post.findOne({ where: { id: id } })
        if (!post) return response.invalidInput('Tidak ditemukan', res)

        const user = req.user

        if (!title) {
            return response.invalidInput('Judul tidak boleh kosong', res)
        }
        let check_title = await db.post.findOne({ where: { [Op.and]: [{ title: title }, { id: { [Op.ne]: id } }] } })
        if (check_title) {
            title += ' ' + new Date().getTime()
        }
        // if (!categories || categories?.length == 0) {
        //     await rollbackUploaded(uploadeds)
        //     return response.invalidInput('Pilih salah satu kategori', res)
        // }

        let slug = await helper.slugify(title);

        post.title = title;
        post.slug = slug;
        post.image = image;
        post.excerpt = excerpt;
        post.type = type;
        post.status = status;
        post.content = content;
        post.visibility = visibility;
        post.comment_status = comment_status;
        post.tags = tags;
        post.sub = sub;

        await post.save({ transaction: t })

        await t.commit()

        return response.success("Update post success", res, {}, 201);
    } catch (err) {
        console.log(err);
        await t.rollback()
        return response.error(err.message || "Failed update post", res);
    }
};
