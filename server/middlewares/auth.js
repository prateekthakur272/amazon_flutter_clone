const jwt = require('jsonwebtoken')
const { passwordKey } = require('../config')

const authorise = (req, res, next) => {
    try {
        const token = req.header('x-auth-token')
        if (token){
            const payload = jwt.verify(token, passwordKey)
            req.user = payload.id;
            req.token = token;
            next();
        }else{
            return res.status(401).json({message: '[x-auth-token] required'})
        }
    } catch (error) {
        return res.status(500).json({error: error.message})
    }
}

module.exports = {authorise}