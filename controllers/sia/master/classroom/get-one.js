const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const { Op, Sequelize } = require("sequelize");

exports.getOne = async (req, res) => {
    try {

        const { id } = req.params

        const classroom = await db.classroom.findOne({
            attributes: [
                'id', 'code', 'room', 'name', 'created_at'
            ],
            where: { id: id },
        })

        return response.success("Get kelas sukses ", res, classroom, 200);
    } catch (err) {
        console.log(err);
        return response.error(err.message || "Gagal", res);
    }
};
