import 'package:amazon_flutter_clone/constants/constants.dart';
import 'package:amazon_flutter_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemExtent: 80,
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, index) =>
              CategoryButton(map: GlobalVariables.categoryImages[index])),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final Map<String, String> map;
  const CategoryButton({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              map['image']!,
              height: 48,
              width: 48,
            ),
          ),
          space4,
          Text(map['title']!),
        ],
      ),
    );
  }
}
