const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.create = async (req, res) => {
    const t = await sequelize.transaction();
    try {

        const {
            classroom_id,
            eduyear_id,
            students
        } = req.body

        const user = req.user

        await Promise.all(students.map(async (item) => {
            const {
                id, student_id, is_delete
            } = item

            if (!id) {
                let check = await db.student_class.findOne({
                    where: {
                        [Op.and]: [
                            { student_id: student_id }, { eduyear_id: eduyear_id }
                        ]
                    }
                })
                await db.student_class.create({
                    classroom_id: classroom_id,
                    eduyear_id: eduyear_id,
                })
            }

        }))

        return response.success("Get siswa menduduki kelas sukses", res, result, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal get siswa menduduki kelas", res);
    }
};
