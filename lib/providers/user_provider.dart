import 'package:amazon_flutter_clone/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  User _user = User(name: '', email: '', password: '', address: '', id: '', type: '', token: '');

  // ignore: unnecessary_getters_setters
  User get user => _user;

  set user(User user){
    _user = user;
    notifyListeners();
  }
}