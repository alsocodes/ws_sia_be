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
                const role = await db.role.findOne({ where: { name: "student" } })
                await Promise.all(csvData.map(async (data) => {
                    const eduyear = await db.eduyear.findOne({ where: { code: data.eduyear } })
                    const classroom = await db.classroom.findOne({ where: { [Op.and]: [{ code: data.grade }, { room: data.room }] } })
                    const check = await db.student.findOne({ where: { nisn: data.nisn } })
                    if (check) {
                        countFailed++;
                        data['fail_message'] = 'Siswa sudah ditambahkan'
                        dataFails.push(data)
                    }
                    else if (!eduyear) {
                        countFailed++;
                        data['fail_message'] = 'Tahun ajaran tidak valid'
                        dataFails.push(data)
                    } else if (!classroom) {
                        countFailed++;
                        data['fail_message'] = 'Kelas dan atau rombel tidak valid'
                        dataFails.push(data)
                    } else {

                        // if(!classroom) throw new Error("Kelas tidak ditemukan");
                        const user = await db.user.create({
                            name: data.name,
                            email: data.email,
                            nisn: data.nisn,
                            password: await bcrypt.hash(data.day_birth, 10),
                            role_id: role.id,
                            user_type: 'student'
                        }, { transaction: t })

                        if (!user) {
                            countFailed++
                            data['fail_message'] = 'Error create user'
                            dataFails.push(data)
                        } else {
                            const student = await db.student.create({
                                user_id: user.id,
                                nisn: data.nisn,
                                nis: data.nis,
                                nik: data.nik,
                                no_akta: data.no_akta,
                                name: data.name,
                                gender: data.gender,
                                place_birth: data.place_birth,
                                day_birth: data.day_birth,
                                religion: data.religion,
                                height: data.height == '' ? null : data.height,
                                weight: data.weight == '' ? null : data.weight,
                                special_needs: data.special_needs,
                                phone: data.phone,
                                email: data.email,
                                address: data.address,
                                rt: data.rt,
                                rw: data.rw,
                                urban: data.urban,
                                sub_district: data.sub_district,
                                city: data.city,
                                postal_code: data.postal_code,
                                father_name: data.father_name,
                                father_job: data.father_job,
                                father_education: data.father_education,
                                father_email: data.father_email,
                                father_phone: data.father_phone,
                                mother_name: data.mother_name,
                                mother_job: data.mother_job,
                                mother_education: data.mother_education,
                                mother_email: data.mother_email,
                                mother_phone: data.mother_phone,
                                guardian_name: data.guardian_name,
                                entry_year: data.entry_year
                            }, { transaction: t })
                            if (!student) {
                                countFailed++
                                data['fail_message'] = 'Error create student'
                                dataFails.push(data)
                            } else {
                                let student_class = await db.student_class.create({
                                    classroom_id: classroom.id,
                                    eduyear_id: eduyear.id,
                                    student_id: student.id,
                                    created_by: userLogin.id,
                                    updated_by: userLogin.id,
                                }, { transaction: t })
                                if (!student_class) {
                                    countFailed++
                                    data['fail_message'] = 'Error create student class'
                                    dataFails.push(data)
                                } else {
                                    countSuccess++;
                                }

                            }

                        }

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

    // } catch (err) {
    //     
    // }
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
        let key = ["nisn", "nis", "nik", "no_akta", "name", "gender", "place_birth", "day_birth", "religion", "height", "weight", "special_needs", "phone", "email", "address", "rt", "rw", "urban", "sub_district", "city", "postal_code", "father_name", "father_job", "father_education", "father_email", "father_phone", "mother_name", "mother_job", "mother_education", "mother_email", "mother_phone", "guardian_name", "entry_year", "grade", "room", "eduyear"]

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
                // console.log(csvData)
            })
            .on("end", function async() {
                // Remove Header ROW
                csvData.shift();

                // // Open the MySQL connection
                // db.connect((error) => {
                //     if (error) {
                //         console.error(error);
                //     } else {
                //         let query = 'INSERT INTO customer (id, address, name, age) VALUES ?';
                //         db.query(query, [csvData], (error, response) => {
                //             console.log(error || response);
                //         });
                //     }
                // });

                // delete file after saving to MySQL database
                // -> you can comment the statement to see the uploaded CSV file.
                fs.unlinkSync(csvFile)
                resolve(csvData);
            }).on('error', reject);

        stream.pipe(csvStream);
    })
}