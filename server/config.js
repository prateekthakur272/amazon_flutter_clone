const dotenv = require('dotenv')
dotenv.config()

databaseUrl = process.env.DB_URL
module.exports = {databaseUrl}