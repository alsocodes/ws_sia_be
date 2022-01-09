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

        const classroom = await db.classroom.findOne({where:{id:classroom_id}})
        const eduyear = await db.eduyear.findOne({where : {id:eduyear_id}})
        console.log(eduyear.status)
        if(eduyear.status !== 'active') return response.invalidInput("Tidak bisa menambahkan pada tahun ajaran yang tidak aktif", res)

        await Promise.all(students.map(async (item) => {
            const {
                id, student_id, is_delete
            } = item

            const student = await db.student.findOne({
                attributes :['id','name'],
                include : {
                    model : db.student_class,
                    attributes: ['id', 'status'],
                    include :  {
                        model: db.classroom,
                        attributes: ['id', 'code', 'room', 'name']
                    },
                },
                where : {id: student_id}
            })
            if (!id) { // create new
                let check = await db.student_class.findOne({
                    where: {
                        [Op.and]: [
                            { student_id: student_id }, { eduyear_id: eduyear_id }, {classroom_id : classroom_id}
                        ]
                    }
                })

                if(check) return response.invalidInput(`${student.name} sudah/sedang duduk di kelas ${classroom.code} tahun ${eduyear.name}`, res)
                if(classroom.code === 'VIII' || classroom.code === 'IX'){
                    let has_class = student.student_classes.filter(item=> item.classroom.code === classroom.code && item.classroom.status === 'passed')
                    if(has_class.length === 0) return response.invalidInput(`${student.name} tidak bisa mengikuti kelas ${classroom.code} karena belum lulus kelas sebelumnya`, res)
                }

                await db.student_class.create({
                    classroom_id: classroom_id,
                    eduyear_id: eduyear_id,
                    student_id : student_id,
                    created_by : user.id,
                    updated_by : user.id,
                },{transaction : t})
            }else{
                const student_class = await db.student_class.findOne({where :{id:id}})
                if(is_delete === true)  await student_class.destroy({transaction:t})
            }

        }))
        t.commit()
        return response.success("Sukses", res, {}, 200);
    } catch (err) {
        console.log(err);
        t.rollback()
        return response.error(err.message || "Gagal", res);
    }
};
