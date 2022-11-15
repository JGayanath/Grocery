import 'package:flutter/material.dart';

class UtilFuntions{
  static void navigateTo(BuildContext context, Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
  }
  static void backToPage(BuildContext context){
    Navigator.pop(context);
  }
}