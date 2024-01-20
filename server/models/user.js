const mongoose = require('mongoose')

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
module.exports = User;