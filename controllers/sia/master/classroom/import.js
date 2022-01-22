const db = require("../../../../models");
const helper = require("../../../../utils/helper");
const response = require("../../../../utils/response");
const sequelize = require('../../../../models').sequelize;
const fs = require('fs');
const multer = require('multer');
const sharp = require('sharp');
const path = require('path');
const dir_temp = path.join(__dirname, "../../../../public/temp/")
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

const imageFilter = (req, file, cb) => {
    let ext = path.extname(file.originalname).toLowerCase();
    if (ext !== ".csv") {
        return cb(new Error("Only csv file allowed"));
    }

    cb(null, true);
}

exports.importData = async (req, res) => {
    const t = await sequelize.transaction();
    try {
        let uploadImage = multer({ storage: storage(), fileFilter: imageFilter, limits: { fileSize: 2000000, }, }).single("file")
        uploadImage(req, res, async (err) => {
            if (err) {
                return response.invalidInput(err.message, res)
            }

            const userLogin = req.user
            let csvData = [];
            let countSuccess = 0;
            let countFailed = 0;
            let dataFails = []
            if (req.file) {
                csvData = await readCsv(dir_temp + '/' + req.file.filename)
                await Promise.all(csvData.map(async (data) => {
                    let check = await db.classroom.findOne({ where: { [Op.or]: [{ code: data.code }, { name: data.name }, { room: data.room }] } })
                    if (check) {
                        countFailed++;
                        data['fail_message'] = "Kode/Room/Nama kelas sudah ada"
                        dataFails.push(data)
                    } else {
                        await db.classroom.create({
                            code: data.code,
                            room: data.room,
                            name: data.name
                        })
                        countSuccess++
                    }
                }))
            }
            await t.commit()
            let csvFail;
            if (dataFails.length > 0) {
                csvFail = await writeCsv(dataFails)
                console.log(csvFail)
                return response.success(`${countSuccess} data berhasil. ${countFailed ? countFailed + ' data gagal' : ''} `, res, { fail: helper.tempUrl + csvFail }, 201);
            } else {
                return response.success(`${countSuccess} data berhasil. ${countFailed ? countFailed + ' data gagal' : ''} `, res, {}, 201);
            }
        })

    } catch (error) {
        console.log(err);
        await t.rollback()
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