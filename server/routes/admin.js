const express = require('express');

const router = express.Router()
const {admin} = require('../middlewares/admin');
const Product = require('../models/product');

router.post('/admin/add-product', admin, async (req, res) => {
    try {
        const {name, description, images, quantity, price, category} = req.body;
        let product = new Product({name, description, images, quantity, price, category});
        product = await product.save();
        return res.json(product);
    } catch (e) {
        return res.status(500).json({error : e.message})
    }
})

module.exports = router;