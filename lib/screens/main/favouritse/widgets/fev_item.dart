import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/models/model_providers/home/product_provider.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/screens/home/product_details/product_details.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';

class Favouritse_Item extends StatelessWidget {
  Favouritse_Item({
    required this.product_model,
    Key? key,
  }) : super(key: key);

  Product_Model product_model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap:  (){
        //--- clear counter
        Provider.of<Cart_Provider>(context ,listen: false).clearCounter();

        //----- first set the product model
        Provider.of<Product_Provider>(context ,listen: false).productModel = product_model;
        //---- after navigate
        UtilFuntions.navigateTo(context, Product_Details());

      },
      child: Container(
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
                 child: Image.network(product_model.image,height: 70,width: 70,)),
             SizedBox(
               width: 16.0,
             ),
             Custom_Text(
               "${product_model.productName}",
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
                  InkWell(
                    onTap: () => Provider.of<Product_Provider>(context,listen: false).removeFovourites(product_model,context),
                    child: Icon(Icons.clear,color: Colors.red
                    ),
                  ),
                  Custom_Text("Rs.${product_model.price}",fontWeight: FontWeight.w500,fontSize: 15.0,color: Colors.black,)
                ],
              ),
        ]),
      ),
    );
  }
}
