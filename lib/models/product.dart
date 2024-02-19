import 'dart:convert';

const productCategories = [
  'Mobiles',
  'Essentials',
  'Appliances',
  'Books',
  'Fashion'
];

class Product {
  final String name;
  final String description;
  final double quantity;
  final double price;
  final String category;
  final String? id;
  final String? rating;
  final List<String> images;

  Product(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.price,
      required this.category,
      this.id,
      this.rating,
      required this.images});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['_id'],
        rating: map['rating'],
        name: map['name'],
        description: map['description'],
        quantity: map['quantity'],
        price: map['price'],
        category: map['category'],
        images: map['images']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating,
    };
  }

  factory Product.fromJson(String source) {
    return Product.fromMap(jsonDecode(source));
  }

  String toJson() => jsonEncode(toMap());
}
