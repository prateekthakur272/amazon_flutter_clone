const dotenv = require('dotenv')
dotenv.config()

databaseUrl = process.env.DB_URL
passwordKey = process.env.PASSWORD_KEY

module.exports = {databaseUrl, passwordKey}