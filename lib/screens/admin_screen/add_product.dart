import 'dart:io';

import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/constants/utils.dart';
import 'package:amazon_flutter_clone/models/product.dart';
import 'package:amazon_flutter_clone/services/admin_service.dart';
import 'package:amazon_flutter_clone/widgets/custom_form_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productQuantity = TextEditingController();
  final _addProductFormKey = GlobalKey<FormState>();
  String productCategory = productCategories.first;
  List<File> images = [];

  @override
  void dispose() {
    _productName.dispose();
    _productDescription.dispose();
    _productPrice.dispose();
    _productQuantity.dispose();
    super.dispose();
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProduct() async {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      showLoader(context);
      AdminService.sellProduct(
          context: context,
          name: _productName.text,
          description: _productDescription.text.trim(),
          quantity: double.parse(_productQuantity.text.trim()),
          price: double.parse(_productPrice.text.trim()),
          category: productCategory,
          images: images).then((_){
            Navigator.pop(context);
            Navigator.pop(context);
            showSnackBar(context, 'Product added successfuly', backgroundColor: Colors.green.shade400);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
            key: _addProductFormKey,
            child: Column(
              children: [
                images.isEmpty
                    ? GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          radius: const Radius.circular(16),
                          borderType: BorderType.RRect,
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                space8,
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : CarouselSlider(
                        items: images.map((e) => Image.file(e)).toList(),
                        options: CarouselOptions(
                            height: 200,
                            enlargeCenterPage: false,
                            viewportFraction: 1)),
                space24,
                CustomFormField(
                    controller: _productName, label: 'Product Name'),
                space8,
                CustomFormField(
                  controller: _productDescription,
                  label: 'Description',
                  maxLines: 7,
                ),
                space8,
                CustomFormField(controller: _productPrice, label: 'Price'),
                space8,
                CustomFormField(
                    controller: _productQuantity, label: 'Quantity'),
                space8,
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: productCategory,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        productCategory = value!;
                      });
                    },
                  ),
                ),
                space8,
                space8,
                ElevatedButton(onPressed: sellProduct, child: const Text('Add'))
              ],
            )),
      ),
    );
  }
}
