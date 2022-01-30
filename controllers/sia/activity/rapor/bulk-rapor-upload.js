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
    let upload = multer({ storage: storage(), fileFilter: fileFilter, limits: { fileSize: 5000000, }, }).single("file")
    upload(req, res, async (err) => {
        if (err) {
            return response.invalidInput(err.message, res)
        }
        try {
            if (req.file) {
                const rapor = await helper.unZip(dir_temp + '/' + req.file.filename, dir_rapor)
                if (rapor.success === false) return response.error("Upload gagal", res)

                await Promise.all(rapor?.files?.map(async (item) => {
                    const filename = item.name;
                    const file_split = filename.replace(".pdf", "").split("_")
                    const nis = file_split[0]
                    const eduyear_code = file_split[1]
                    const semester_id = parseInt(file_split[2])
                    const classroom = file_split[3].toUpperCase()
                    
                    const student = await db.student.findOne({ where: { nis: nis } })
                    if(!student){
                        const error = new Error("Nis/Siswa tidak valid")
                        error.code = 400
                        throw error
                    }
                    const eduyear = await db.eduyear.findOne({ where: { code: eduyear_code } })
                    if(!eduyear) {
                        const error = new Error("Tahun ajaran tidak valid")
                        error.code = 400
                        throw error
                    }

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
                            student_id: student.id,
                            status: 'active'
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
                            semester_id: semester_id,
                            student_class_id: student_class.id
                        }
                    })
    
                    if(!rapor_siswa){
                        await db.student_class_rapor.create({
                            student_class_id: student_class.id,
                            semester_id: semester_id,
                            file: filename,
                            created_by: req.user.id,
                            updated_by: req.user.id,
                        })
                    }else{
                        rapor_siswa.file = filename
                        rapor_siswa.updated_by = req.user.id
                        await rapor_siswa.save()
                    }
                    
                }))

                if (fs.existsSync(dir_temp + '/' + req.file.filename)) fs.unlinkSync(dir_temp + '/' + req.file.filename)
                return response.success("Upload berhasil", res, {})
            }
        } catch (error) {
            if (fs.existsSync(dir_temp + '/' + req.file.filename)) fs.unlinkSync(dir_temp + '/' + req.file.filename)
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