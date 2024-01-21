const express = require('express')
const User = require('../models/user')

const router = express.Router();

router.post('/api/signup', async (req,res)=>{
    try{
        const {name, email, password} = req.body;
        const user = await User.findOne({email})
        if (user){
            return res.status(400).json({message: `User with email ${email} already exists.`})
        }
        let newUser = new User({email, name, password})
        newUser = await newUser.save()
        res.status(201).json({email, name, id: newUser.id})
    }catch(e) {
        console.error(e);
        res.status(500).json({error: 'some error occurred'})
    }
})

module.exports = router