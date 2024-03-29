import 'dart:convert';
import 'dart:io';

import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/models/product.dart';
import 'package:amazon_flutter_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminService {
  static Future<void> sellProduct(
      {required BuildContext context,
      required String name,
      required String description,
      required double quantity,
      required double price,
      required String category,
      required List<File> images}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final cloudinary = CloudinaryPublic('dkzo7p5w7', 'ifhzxpqp');
    final responses = await cloudinary.uploadFiles(images
        .map((image) => CloudinaryFile.fromFile(image.path, folder: name))
        .toList());
    final imgUrls = responses.map((response) => response.secureUrl).toList();
    final product = Product(
        name: name,
        description: description,
        quantity: quantity,
        price: price,
        category: category,
        images: imgUrls);
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': userProvider.user.token,
    };
    final response = await http.post(Uri.parse('$uri/admin/add-product'),
        headers: headers, body: product.toJson());
    if(response.statusCode==200){
      return;
    }else if(response.statusCode==500){
      throw const HttpException('Internal server error');
    }else{
      throw HttpException(response.body);
    }
  }

  static Future<List<Product>> getAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token':userProvider.user.token,
    };
    final response = await http.get(Uri.parse('$uri/admin/products'), headers: headers);
    if(response.statusCode==200){
      final List data = jsonDecode(response.body);
      final products = data.map((product) => Product.fromMap(product)).toList();
      return products;
    }else if(response.statusCode==401){
      throw const HttpException('unauthorised');
    }else if(response.statusCode==500){
      throw const HttpException('internal server error');
    }else{
      throw const HttpException('');
    }
  }

  static Future<void> deleteProduct(BuildContext context,Product product) async {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final headers = {
      'Content-Type':'application/json; charset=UTF-8',
      'x-auth-token':user.token
    };
    final response = await http.delete(Uri.parse('$uri/admin/products/${product.id??''}'), headers: headers);
    if(response.statusCode==204){
      return;
    }else if(response.statusCode==401){
      throw const HttpException('unauthorised');
    }else if(response.statusCode==500){
      throw const HttpException('internal server error');
    }else{
      throw const HttpException('');
    }
  }
}
