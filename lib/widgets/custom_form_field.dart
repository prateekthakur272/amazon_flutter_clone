import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomFormField({super.key, required this.controller, required this.label});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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