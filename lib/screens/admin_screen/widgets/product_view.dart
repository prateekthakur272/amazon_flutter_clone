import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:amazon_flutter_clone/models/product.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: GlobalVariables.greyBackgroundCOlor)
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: Image.network(product.images.first, fit: BoxFit.cover)),
          space8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.name, style: const TextStyle(fontSize: 16),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline))
            ],
          ),
        ],
      ),
    );
  }
}