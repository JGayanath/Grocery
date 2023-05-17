import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class UtilFuntions{
  static void navigateTo(BuildContext context, Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
  static void backToPage(BuildContext context){
    Navigator.pop(context);
  }


  //---- image picker funtion
  static Future<File> pickerImageFromGallery() async {
    try {
      File _image = File("");
      // Pick an image
      final XFile? pickerFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      //--- check user picker file or not

      if (pickerFile != null) {
        _image = File(pickerFile.path);

        return _image;

      } else {
        Logger().e("No image");
        return File("");
      }
    } catch (e) {
      Logger().e(e);
      return File("");
    }
  }
}