import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message,
    {Color? backgroundColor, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: TextStyle(color: color),),
    backgroundColor: backgroundColor,
  ));
}
