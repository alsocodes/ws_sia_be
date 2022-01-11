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
        console.log(ext)
        return cb(new Error("Only csv file allowed"));
    }

    cb(null, true);
}

exports.importData = async (req, res) => {
    try {
        let uploadImage = multer({ storage: storage(), fileFilter: imageFilter, limits: { fileSize: 500000, }, }).single("file")
        uploadImage(req, res, async (err) => {
            if(err) {
                const error = new Error(err.message)
                error.code = 400
                throw error
            }
          
            let csvData = [];
            if (req.file) {
                const csvFile = dir_temp + '/' + req.file.filename
                let stream = fs.createReadStream(csvFile);
                let csvStream = csv
                .parse()
                .on("data", function (data) {
                    csvData.push(data);
                })
                .on("end", function () {
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
                    // fs.unlinkSync(csvFile)
                });
        
                stream.pipe(csvStream);
            }

            return response.success("import success", res, {csvData:csvData}, 201);
        })
        
    } catch (error) {
        console.log(err);
        return response.error(err.message || "Failed import", res);
    }
    
        // } catch (err) {
        //     
        // }
};