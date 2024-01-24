import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  final String url;
  const OrderView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: .5),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Image.network(url, height: 160, fit: BoxFit.contain,)),
    );
  }
}