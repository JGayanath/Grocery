import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/models/model_providers/home/product_provider.dart';
import 'package:grocery/models/oder_model.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/screens/home/product_details/product_details.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';

class Oder_Item extends StatelessWidget {
  Oder_Item({
    required this.oder_model,
    Key? key,
  }) : super(key: key);

  Oder_Model oder_model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 20,),
      height: 90.0,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 20,
              offset: Offset(0, 10),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
       Row(
         children: [
           ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(15)),
               child: Image.network(oder_model.item.first.product_Model.image,height: 70,width: 70,)),
           SizedBox(
             width: 16.0,
           ),
           Custom_Text(
             "${oder_model.item.first.product_Model.productName}",
             fontSize: 14.0,
             fontWeight: FontWeight.w400,
             color: Colors.black,
           ),
         ],
       ),

        SizedBox(
          height: 7.0,
        ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.clear,color: Colors.red
                ),
                Custom_Text("Rs.${oder_model.total}0",fontWeight: FontWeight.w500,fontSize: 15.0,color: Colors.black,)
              ],
            ),
      ]),
    );
  }
}
