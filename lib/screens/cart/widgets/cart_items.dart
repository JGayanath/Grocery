import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:provider/provider.dart';

class Cart_Items extends StatelessWidget {
  Cart_Items({
    required this.cart_item_model,
    Key? key,
  }) : super(key: key);

  Cart_item_model cart_item_model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10, bottom: 10.0,left: 30,right: 30),
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
              borderRadius: BorderRadius.circular(10),
                child: Image.network(cart_item_model.product_Model.image,width: 70,height: 70,fit: BoxFit.cover,)),
            SizedBox(width: 20.0,),
            Column(
              children: [
                Custom_Text(
                  cart_item_model.product_Model.productName,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    InkWell(
                      onTap: () => Provider.of<Cart_Provider>(context , listen: false).decreaseCartItemCount(context, 1, cart_item_model.product_Model),
                      child: Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Custom_Text(
                      cart_item_model.quantity.toString(),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    
                    InkWell(
                      onTap: () => Provider.of<Cart_Provider>(context , listen: false).increaseCartItemCount(context, 1, cart_item_model.product_Model),
                      child: Icon(
                        Icons.add,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Provider.of<Cart_Provider>(context , listen: false).removeCartItem(cart_item_model.id,context),
                child: Icon(Icons.clear,color: Colors.red
                ),
              ),
              Custom_Text("Rs.${cart_item_model.subTotal.toString()}",fontWeight: FontWeight.w500,fontSize: 15.0,color: Colors.black,)
            ],
          ),
        ],
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  ImageTile({
    required this.urlImage,
    Key? key,
  }) : super(key: key);

  String urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(urlImage),
    );
  }
}
