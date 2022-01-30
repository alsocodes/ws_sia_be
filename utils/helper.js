const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const response = require('./response.js');
const AdmZip = require("adm-zip");
const path = require("path");

const hashPassword = async (res, password) => {
  if (password == null) {
    return response.error('Password cannot be empty', res, 500);
  }
  return await bcrypt.hash(password, 10);
};

const validatePassword = async (plainPassword, hashedPassword) => {
  return await bcrypt.compare(plainPassword, hashedPassword);
};

const validateToken = (token, secretKey) =>
  jwt.verify(token, secretKey, (err, decoded) => (err ? err : decoded));

function validateEmail(email) {
  const splitEmail = email.split('@');
  if (splitEmail.length < 2) {
    return false;
  }
  return true;
}

function checkPassword(password) {
  if (password.length < 8) {
    return false;
  }
  return true;
}

/** Format currency number */
const formatCurrency = (number) => {
  const text = new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
    minimumFractionDigits: 0,
  }).format(number || 0);

  return text.replace(/\xa0/g, " ").replace(/\u202f/g, " ");
};

const slugify = (str) => {
  str = str.replace(/^\s+|\s+$/g, '');

  // Make the string lowercase
  str = str.toLowerCase();

  // Remove accents, swap ñ for n, etc
  var from = "ÁÄÂÀÃÅČÇĆĎÉĚËÈÊẼĔȆÍÌÎÏŇÑÓÖÒÔÕØŘŔŠŤÚŮÜÙÛÝŸŽáäâàãåčçćďéěëèêẽĕȇíìîïňñóöòôõøðřŕšťúůüùûýÿžþÞĐđßÆa·/_,:;";
  var to = "AAAAAACCCDEEEEEEEEIIIINNOOOOOORRSTUUUUUYYZaaaaaacccdeeeeeeeeiiiinnooooooorrstuuuuuyyzbBDdBAa------";
  for (var i = 0, l = from.length; i < l; i++) {
    str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
  }

  // Remove invalid chars
  str = str.replace(/[^a-z0-9 -]/g, '')
    // Collapse whitespace and replace by -
    .replace(/\s+/g, '-')
    // Collapse dashes
    .replace(/-+/g, '-');

  return str;
}

const unZip = async (filepath, destination = null) => {
  try {
    const zip = new AdmZip(filepath);
    const outputDir = destination || `${path.parse(filepath).name}_extracted`;
    zip.extractAllTo(outputDir);

    let files = []
    for (const zipEntry of zip.getEntries()) {
      files.push(zipEntry)
    }

    return {
      success: true,
      files: files
    }
    // console.log(`Extracted to "${outputDir}" successfully`);
  } catch (e) {
    // console.log(`Something went wrong. ${e}`);
    return {
      success: false,
      message: e.message
    }
  }

}


const baseUrl = process.env.BASE_URL_API
const imageUrl = process.env.IMAGE_URL
const tempUrl = process.env.TEMP_URL
const attachmentUrl = process.env.ATTACHMENT_URL

module.exports = {
  imageUrl,
  tempUrl,
  baseUrl,
  attachmentUrl,
  hashPassword,
  validatePassword,
  validateToken,
  validateEmail,
  checkPassword,
  formatCurrency,
  slugify,
  unZip
};
