
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
class Custom_Text extends StatelessWidget {
  const Custom_Text(this.text,{
    this.fontSize=30.0,
    this.color = AppColors.prymeryColor,
    this.fontWeight=FontWeight.w600,
    this.textAlign = TextAlign.center,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color ;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}