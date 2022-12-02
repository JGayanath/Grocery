
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';

class Counter_Section extends StatelessWidget {
  const Counter_Section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.add,
          size: 18,
        ),
         SizedBox(
          width: 10,
        ),
        Custom_Text(
          "1",
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.black,
        ),
         SizedBox(
          width: 10,
        ),
        Icon(
          Icons.remove,
          size: 18,
        ),
      ],
    );
  }
}
