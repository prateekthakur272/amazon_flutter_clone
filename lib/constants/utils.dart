import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message,
    {Color? backgroundColor, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: TextStyle(color: color),),
    backgroundColor: backgroundColor,
  ));
}


Future<List<File>> pickImages() async {
  final List<File> images = [];
  try {
    final files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if(files != null && files.files.isNotEmpty){
      for(var file in files.files){
        images.add(File(file.path!));
      }
    }
  } catch (e) {
   debugPrint(e.toString()); 
  }
  return images;
}