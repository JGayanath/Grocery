
import 'package:flutter/material.dart';

class CustomTextfiled extends StatelessWidget {
  const CustomTextfiled({
    Key? key,
    required this.controller,
    required this.hintText,
    this.isobscure=true,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText ;
  final bool isobscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isobscure,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}