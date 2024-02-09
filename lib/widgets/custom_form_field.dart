import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  const CustomFormField({super.key, required this.controller, required this.label, this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: (value) {
        if(value == null || value.trim().isEmpty){
          return '$label is required';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: label
      ),
    );
  }
}