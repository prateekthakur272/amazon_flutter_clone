const express = require('express')
const User = require('../models/user')

const router = express.Router();

router.post('/api/signup', async (req,res)=>{
    const {name, email, password} = req.body;
    const user = await User.findOne({email:'email'})
    console.log(user);
    res.json({name:'hello'})
})

module.exports = router