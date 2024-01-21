const express = require('express')
const {User, hashPassword} = require('../models/user')
const ValidationError = require('mongoose/lib/error/validation');

const router = express.Router();

router.post('/api/signup', async (req,res)=>{
    try{
        let {name, email, password} = req.body;
        const user = await User.findOne({email})
        if (user){
            return res.status(400).json({error: `User with email ${email} already exists.`})
        }
        password = await hashPassword(password)
        let newUser = new User({email, name, password})
        newUser = await newUser.save()
        res.status(201).json(newUser)
    }catch(e) {
        if (e instanceof ValidationError){
            return res.status(400).json({error: e.message})
        }
        console.error(e);
        return res.status(500).json({error: e.message})
    }
})

module.exports = router