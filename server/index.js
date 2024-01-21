// Prateek Thakur 2024

// imports
const express = require('express')
const {databaseUrl} = require('./config')
const mongoose = require('mongoose')

// routers
const authRouters = require('./routes/auth')

const app = express()
const PORT = 3000

app.use(express.json())
app.use(authRouters)
app.use((req, res) => {
    console.log(`[REQUEST] ${req.url} ${res.statusCode} ${res.statusMessage}`);
})

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
