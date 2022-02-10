const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_rapor = path.join(__dirname, "../../../../public/attachments/")

const storage = () =>
    multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, dir_rapor);
        },
        filename: (req, file, cb) => {
            cb(
                null,
                file.fieldname + "-" + Date.now() + path.extname(file.originalname)
            );
        },
    });

const filter = (req, file, cb) => {
    let ext = path.extname(file.originalname).toLowerCase();
    if (ext !== ".pdf") {
        return cb(new Error("Only pdf are allowed"));
    }

    cb(null, true);
}

exports.update = async (req, res) => {
    let upload = multer({ storage: storage(), fileFilter: filter, limits: { fileSize: 2000000, }, }).single("file")
    upload(req, res, async (err) => {

        try {
            if (err) throw err;
            if (req.file) {

                const {
                    student_id,
                    eduyear_id,
                    final_score
                } = req.body
                const eduyear = await db.eduyear.findOne({ where: { id: eduyear_id } })
                const student = await db.student.findOne({
                    attributes: ['id', 'name', 'nisn', 'nis'],
                    required: true,
                    include: [
                        {
                            attributes: ['id', 'classroom_id', 'eduyear_id'],
                            model: db.student_class,
                            where: {
                                status: 'passed',
                                eduyear_id: eduyear.id
                            },
                            include: {
                                model: db.classroom,
                                attributes: ['id', 'code', 'name'],

                            },
                        }
                    ],
                    where: {
                        id: student_id
                    }
                })

                if (!student || student?.student_classes?.length !== 1 || student?.student_classes?.[0]?.classroom?.code !== 'IX') {
                    // console.log(!student, !student?.student_classes?.length !== 1, !student?.student_classes?.length, student?.student_classes?.[0]?.classroom?.code !== 'IX')
                    const error = new Error("Nis/Siswa tidak valid")
                    error.code = 400
                    throw error
                }

                const old_file = dir_rapor + req.file.filename
                const new_file = `${student.nis}_${eduyear.code}_${final_score}.pdf`

                fs.renameSync(old_file, dir_rapor + new_file)


                const graduation = await db.graduation.findOne({ where: { student_id: student.id } })

                if (!graduation) {
                    await db.graduation.create({
                        student_id: student.id,
                        eduyear_id: eduyear.id,
                        file: new_file,
                        final_score: final_score,
                        created_by: req.user.id,
                        updated_by: req.user.id,
                    })
                } else {
                    graduation.file = new_file
                    graduation.final_score = final_score
                    graduation.updated_by = req.user.id
                    await graduation.save()
                }
            }


            return response.success("Upload success", res, {}, 200);
        } catch (err) {
            console.log(err);
            return response.error(err.message || "Failed upload", res);
        }
    })
};