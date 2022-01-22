const { attachmentUrl } = require("../../utils/helper");
const fs = require('fs');
const path = require('path');
const dir_attachment = path.join(__dirname, "../../public/attachments/")
const response = require("../../utils/response");

const download = (req, res) => {
    try {
        const { file } = req.query;
        if (!file) return response.invalidInput("please spesify file", res)
        // console.log(dir_attachment)
        const dir_file = `${dir_attachment}${file}`
        if (!fs.existsSync(dir_file)) return response.invalidInput("file not found", res)

        return res.download(dir_file); // Set disposition and send it.
    } catch (error) {
        return response.error("please spesify file", res, error.code)
    }
}

module.exports = { download }