
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';
class Custom_Text extends StatelessWidget {
  const Custom_Text({
    required this.text,
    this.fontSize=30.0,
    required this.color,
    this.fontWeight=FontWeight.w600,
    Key? key,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}