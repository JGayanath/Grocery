
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/utils/app_colors.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({
    required this.onTap,
    required this.text,
    this.isLoader=false,
    Key? key,
  }) : super(key: key);

  final Function () onTap;
  final String text;
  final bool isLoader;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: 259,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.prymeryColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Align(
            alignment: Alignment.center,
            child: isLoader ? CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.whiteColour,
            ):
            Custom_Text(text,color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w500,)),
      ),
    );
  }
}