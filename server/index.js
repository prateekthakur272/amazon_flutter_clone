// Prateek Thakur 2024

// imports
const express = require('express')
const {databaseUrl} = require('./config')
const mongoose = require('mongoose')

// routers
const authRoutes = require('./routes/auth')
const adminRoutes = require('./routes/admin')

const app = express()
const PORT = 3000

app.use(express.json())
app.use(authRoutes)
app.use(adminRoutes)

mongoose.connect(databaseUrl).then(
    () => {
        console.log('[CONNECTED] Database connected');
    },
    (error) => {
        console.log(`[MONGOOSE ERROR] ${error.message}`);
    })

app.listen(PORT, () => {
    console.log(`[LISTENING] server listening on port ${PORT}`);
})
