import 'dart:convert';
import 'dart:io';

import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/models/user.dart';
import 'package:http/http.dart' as http;

class AuthService {

  static Future<User> signUp(
      {required String email,
      required String name,
      required String password}) async {
    final user = User.basicUser(name, email, password);
    final response = await http.post(Uri.parse('$uri/api/signup'),
        body: user.toJson(), headers: {'content-type': 'application/json'});
    if (response.statusCode == 201) {
      return user;
    }else if(response.statusCode == 500){
      throw const HttpException('Server Error');
    }
    throw HttpException(jsonDecode(response.body)['error']);
  }

  static Future<User> signIn({required String email, required String password}) async {
    final user = User.signInUser(email, password);
    final response = await http.post(Uri.parse('$uri/api/signin'),
        body: user.toJson(), headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }else if(response.statusCode == 500){
      throw const HttpException('Server Error');
    }
    throw HttpException(jsonDecode(response.body)['message']);
  }

}
