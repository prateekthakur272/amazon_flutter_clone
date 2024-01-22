const express = require('express')
const {User, hashPassword, verifyPassword} = require('../models/user')
const ValidationError = require('mongoose/lib/error/validation');
const jwt = require('jsonwebtoken');
const { passwordKey } = require('../config');
const { authorise } = require('../middlewares/auth');

const router = express.Router();

router.post('/api/signup', async (req,res)=>{
    try{
        let {name, email, password} = req.body;
        if (!email || !name || !password) {
            return res.status(404).json({message: 'required [name, email, password]'});
        }
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

router.post('/api/signin', async (req, res)=>{
    try{
        const {email, password} = req.body;
        if (!email || !password) {
            return res.status(404).json({message: 'required [email, password]'});
        }
        const user = await User.findOne({email})
        if (user){
            if (await verifyPassword(password, user.password)){
                token = jwt.sign({
                    id:user._id,
                    email
                }, passwordKey)
                return res.json({token, ...user._doc})
            }
            return res.status(401).json({message: 'Invalid password'})
        }
        return res.status(404).json({message: 'User not found'});
    }catch(e){
        console.error(e);
        res.status(500).json({error: 'Internal server error'});
    }
})

router.get('/api/token', async (req, res)=>{
    const token = req.header('x-auth-token')
    if (token){
        const payload = jwt.verify(token, passwordKey);
        if(payload){
            const user = await User.findOne({_id: payload.id})
            return res.json(user)
        }
        return res.status(401).json({message: 'Invalid token'})
    }
    return res.status(400).json({message: '[x-auth-token] header required'})
})

router.get('/user/me', authorise, async (req, res)=>{
    const user = await User.findById(req.user)
    return res.json({token: req.token, ...user._doc})
})

module.exports = router