import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
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
            child: Column(
          children: [
            DottedBorder(
              radius: const Radius.circular(16),
              borderType: BorderType.RRect,
              dashPattern: const [10, 4],
              strokeCap: StrokeCap.round,
                child: Container(
              width: double.infinity,
              height: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_open, size: 40,),
                      space8,
                      Text('Select Product Images', style: TextStyle(color: Colors.grey),)
                    ],
                  ),
            ),
            )
          ],
        )),
      ),
    );
  }
}
