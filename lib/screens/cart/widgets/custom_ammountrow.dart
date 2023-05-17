
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';

class Custom_AmmountRow extends StatelessWidget {
  const Custom_AmmountRow({
    required this.text,
    required this.price,
    Key? key,
  }) : super(key: key);


  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text("${text}",color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14,),
        Custom_Text("${price}",color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14,),
      ],
    );
  }
}
