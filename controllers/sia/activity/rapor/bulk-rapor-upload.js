const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_temp = path.join(__dirname, "../../../../public/temp/")
const dir_rapor = path.join(__dirname, "../../../../public/rapor/")
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

exports.bulkRaporUpload = async (req, res) => {
    // const t = await sequelize.transaction();
    try {
        let upload = multer({ storage: storage(), fileFilter: fileFilter, limits: { fileSize: 5000000, }, }).single("file")
        upload(req, res, async (err) => {
            if (err) {
                return response.invalidInput(err.message, res)
            }

            if (req.file) {
                const rapor = await helper.unZip(dir_temp + '/' + req.file.filename, dir_rapor)
                if (rapor.success === false) return;

                // await Promise.all(rapor?.files?.map(async (item) => {
                const file_split = rapor.files[0].name.replace(".pdf", "").split("_")
                const nis = file_split[0]
                const eduyear_code = file_split[1]
                const semester_id = file_split[2]
                const classroom = file_split[3].toUpperCase()


                const student = await db.student.findOne({ where: { nis: nis } })
                const eduyear = await db.eduyear.findOne({ where: { code: eduyear_code } })
                const student_class = await db.student_class.findOne({
                    include: {
                        model: db.classroom,
                        attributes: ['code', 'name', 'room'],
                        where: {
                            code: classroom
                        }
                    },
                    where: {
                        eduyear_id: eduyear.id,
                        student_id: student.id
                    }
                })
                const rapor_siswa = await db.student_class_rapor.findOne({
                    attributes: [
                        'id', 'file'
                    ],
                    include: {
                        model: db.student_class,
                    },
                    where: {
                        semester_id: semester_id
                    }
                })

                // if(!rapor_siswa){
                //     await db.student_class_rapor.create({

                //     })
                // }
                return response.success("Upload berhasil", res, { student_class, classroom, file_split, rapor })

                // }))

            }
            return response.error("Error", res)
        })

    } catch (error) {
        console.log(err);
        // await t.rollback()
        return response.error(err.message || "Failed import", res);
    }
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