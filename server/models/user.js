const mongoose = require('mongoose')
const bcrypt = require('bcryptjs')

const userSchema = mongoose.Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
        },
        email: {
            type: String,
            required: true,
            trim: true,
            validate: {
                validator: (value) => {
                    return value.match(
                        /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    );
                },
                message: 'Please enter a valid email address'
            }
        },
        password: {
            required: true,
            type: String,
            trim: true,
            validate: {
                validator: (value)=>{
                    return value.length >= 8;
                }
            }
        },
        address: {
            type: String,
            default: ''
        },
        type:{
            type: String,
            default: 'user'
        }
    }
);

const User = mongoose.model('User', userSchema);

const hashPassword = async (password) => {
    return await bcrypt.hash(password, 8)
}

const verifyPassword = async (plainPassword, hashedPassword) => {
    bcrypt.compare(plainPassword, hashedPassword)
}

module.exports = {User, hashPassword, verifyPassword};