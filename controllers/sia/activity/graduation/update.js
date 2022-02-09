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
            if (req.file) {
                const {
                    id,
                    student_id,
                    semester_id,
                    classroom_id,
                    eduyear_id
                } = req.body

                const student = await db.student.findOne({ where: { id: student_id } })
                const classroom = await db.classroom.findOne({ where: { id: classroom_id } })
                const eduyear = await db.eduyear.findOne({ where: { id: eduyear_id } })
                const student_class = await db.student_class.findOne({
                    where: {
                        classroom_id: classroom.id,
                        eduyear_id: eduyear.id,
                        student_id: student.id
                    }
                })

                const old_file = dir_rapor + req.file.filename
                const new_file = `${student.nis}_${eduyear.code}_${semester_id}_${classroom.code.toLowerCase()}.pdf`

                fs.renameSync(old_file, dir_rapor + new_file)
                if (parseInt(id) === 0) {
                    await db.student_class_rapor.create({
                        student_class_id: student_class.id,
                        semester_id: semester_id,
                        file: new_file,
                        created_by: req.user.id,
                        updated_by: req.user.id
                    })
                } else {
                    const rapor = await db.student_class_rapor.findOne({ where: { id: id } })
                    rapor.file = new_file;
                    await rapor.save()
                }


            }


            return response.success("Upload success", res, {}, 200);
        } catch (err) {
            console.log(err);
            return response.error(err.message || "Failed upload", res);
        }
    })
};