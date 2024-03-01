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

router.get('/admin/products', async (req, res)=>{
    try{
        let products = await Product.find({})
        return res.json(products)
    }catch(e){
        return res.status(500).json({error : e.message})
    }
})

router.delete('/admin/products/:id', async (req, res)=>{
    let id = req.params.id;
    try{
        let product = await Product.findByIdAndDelete(id);
        if(product){
            product.save()
            return res.status(204)
        }
        return res.status(404).json({'detail':'product not found'})
    }catch(e){
        return res.status(500).json({error : e.message})
    }
})

module.exports = router;