
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:provider/provider.dart';

class Counter_Section extends StatelessWidget {
  const Counter_Section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart_Provider>(builder: (context , value , child){
      return Row(
        children: [
          InkWell(
            onTap: () => value.increaseCounter(),
            child: Icon(
              Icons.add,
              size: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Custom_Text(
            value.counter.toString(),
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () => value.decreaseCounter(),
            child: Icon(
              Icons.remove,
              size: 18,
            ),
          ),
        ],
      );
    }) ;
  }
}
