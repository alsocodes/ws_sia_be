const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_temp = path.join(__dirname, "../../../../public/temp/")
const dir_rapor = path.join(__dirname, "../../../../public/attachments/")
const csv = require('fast-csv');
const { Op, Sequelize } = require("sequelize");
const bcrypt = require('bcrypt');

const storage = () =>
    multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, dir_temp);
        },
        filename: (req, file, cb) => {
            cb(
                null,
                file.fieldname + "-" + Date.now() + path.extname(file.originalname)
            );
        },
    });

const fileFilter = (req, file, cb) => {
    let ext = path.extname(file.originalname).toLowerCase();
    if (ext !== ".zip") {
        return cb(new Error("Only ZIP file allowed"));
    }

    cb(null, true);
}

exports.bulkGraduationUpload = async (req, res) => {
    let upload = multer({ storage: storage(), fileFilter: fileFilter, limits: { fileSize: 5000000, }, }).single("file")
    upload(req, res, async (err) => {
        if (err) {
            return response.invalidInput(err.message, res)
        }
        try {
            if (req.file) {
                const rapor = await helper.unZip(dir_temp + '/' + req.file.filename, dir_rapor)
                if (rapor.success === false) return response.error("Upload gagal", res)

                // const classroom = await db.classroom.findOne({where: {code : 'IX'}})
                await Promise.all(rapor?.files?.map(async (item) => {
                    const filename = item.name;
                    const file_split = filename.replace(".pdf", "").split("_")
                    const nis = file_split[0]
                    const eduyear_code = file_split[1]
                    const score = file_split[2]
                    console.log(score)

                    const eduyear = await db.eduyear.findOne({ where: { code: eduyear_code } })
                    if (!eduyear) {
                        const error = new Error("Tahun ajaran tidak valid")
                        error.code = 400
                        throw error
                    }

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
                            nis: nis
                        }
                    })

                    // return response.success('xx', res, student, 200)

                    if (!student || student?.student_classes?.length !== 1 || student?.student_classes?.[0]?.classroom?.code !== 'IX') {
                        // console.log(!student, !student?.student_classes?.length !== 1, !student?.student_classes?.length, student?.student_classes?.[0]?.classroom?.code !== 'IX')
                        const error = new Error("Nis/Siswa tidak valid")
                        error.code = 400
                        throw error
                    }

                    const graduation = await db.graduation.findOne({ where: { student_id: student.id } })

                    if (!graduation) {
                        await db.graduation.create({
                            student_id: student.id,
                            eduyear_id: eduyear.id,
                            file: filename,
                            final_score: score,
                            created_by: req.user.id,
                            updated_by: req.user.id,
                        })
                    } else {
                        graduation.file = filename
                        graduation.final_score = score
                        graduation.updated_by = req.user.id
                        await graduation.save()
                    }

                }))

                if (fs.existsSync(dir_temp + '/' + req.file.filename)) fs.unlinkSync(dir_temp + '/' + req.file.filename)
                return response.success("Upload berhasil", res, {})
            }
        } catch (error) {
            if (fs.existsSync(dir_temp + '/' + req.file.filename)) fs.unlinkSync(dir_temp + '/' + req.file.filename)
            console.log(error)
            return response.error(error.message || "Failed import", res);
        }

    })
};

const writeCsv = async (data) => {
    return new Promise((resolve, reject) => {
        const filename = 'fail-import-' + new Date().getTime() + '.csv';
        const file = dir_temp + filename;
        const ws = fs.createWriteStream(file);
        csv
            .write(data, { headers: true })
            .on("finish", function () {
                console.log("Write to CSV successfully!");
                resolve(filename)
            })
            .pipe(ws)
            .on("error", reject)
    })
}

const readCsv = async (csvFile) => {
    return new Promise((resolve, reject) => {
        let key = ["code", "room", "name"]

        let stream = fs.createReadStream(csvFile);
        let csvData = [];
        let csvStream = csv
            .parse()
            .on("data", function async(data) {
                let objData = {}
                for (var i = 0; i < key.length; i++) {
                    objData[key[i]] = data[i]
                }
                csvData.push(objData);
            })
            .on("end", function async() {
                // Remove Header ROW
                csvData.shift();
                fs.unlinkSync(csvFile)
                resolve(csvData);
            }).on('error', reject);

        stream.pipe(csvStream);
    })
}