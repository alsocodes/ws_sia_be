const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {

        const { id } = req.params

        const teacher = await db.teacher.findOne({
            attributes: [
                'id', 'user_id', 'nip',
                'name', 'gender', 'place_birth', 'day_birth', 'religion', 'address',
                'employee_group', 'position', 'last_education',
                'email', 'phone', 'entry_year', 'created_at'
            ],
            where: { id: id },
        })

        return response.success("Get guru sukses ", res, teacher, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
