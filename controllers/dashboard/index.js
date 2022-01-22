const { attachmentUrl } = require("../../utils/helper");
const fs = require('fs');
const path = require('path');
const dir_attachment = path.join(__dirname, "../../public/attachments/")
const response = require("../../utils/response");
const db = require("../../models");

const dashboard = async (req, res) => {
    try {
        const userLogin = req.user
        const user = await db.user.findOne({ where: { id: userLogin.id } })
        let result = {
            name: user.name,
            last_login: user.last_login
        }

        if (user.user_type === "administrator") {

        }

        if (user.user_type === "teacher") {
            const teacher = await db.teacher.findOne({ where: { user_id: userLogin.id } })
            result['nip'] = teacher.nip
        }

        if (user.user_type === "student") {
            const student = await db.student.findOne({ where: { user_id: userLogin.id } })
            result['nisn'] = student.nisn
            result['entry_year'] = student.entry_year
            const student_class = await db.student_class.findOne({
                attributes: ["id"],
                include: [
                    {
                        model: db.classroom,
                        attributes: ["id", "code", "name"]
                    },
                    {
                        model: db.eduyear,
                        attributes: ["id", "code", "name"]
                    }
                ],
                where: {
                    student_id: student.id,
                    status: 'active',
                }
            })

            result["class_active"] = student_class
        }

        return response.success("Get dashboard success", res, result, 200)

    } catch (error) {
        console.log(error)
        return response.error(error.message, res, error.code)
    }
}

module.exports = { dashboard }