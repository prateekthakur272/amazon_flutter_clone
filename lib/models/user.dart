import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String address;
  final String id;
  final String type;
  final String token;
  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.id,
      required this.type,
      required this.token});

  factory User.basicUser(String name, String email,  String password){
    return User(name: name, email: email, password: password, address: '', id: '', type: 'user', token: '');
  }

  factory User.signUpUser(String name, String email,  String password){
    return User(name: name, email: email, password: password, address: '', id: '', type: 'user', token: '');
  }

  factory User.signInUser(String email,  String password){
    return User(name: '', email: email, password: password, address: '', id: '', type: 'user', token: '');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'],
        email: map['email'],
        password: map['password'],
        address: map['address'],
        id: map['_id'],
        type: map['type'],
        token: map['token']);
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));

  User copyWith(String? id, String? email, String? name, String? password,
      String? address, String? type, String? token) {
    return User(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        address: address ?? this.address,
        id: id ?? this.id,
        type: type ?? this.type,
        token: token ?? this.token);
  }
}
