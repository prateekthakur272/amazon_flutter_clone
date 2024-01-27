import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50), child: AppBar(
            title: const Text('Add Product', style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.black,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient
              ),
            ),
          ),
        ),
    );
  }
}