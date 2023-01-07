import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/screens/cart/success.dart';
import 'package:grocery/screens/cart/widgets/cart_items.dart';
import 'package:grocery/screens/cart/widgets/custom_ammountrow.dart';
import 'package:grocery/utils/util_funtions.dart';

class Cart_scrren extends StatefulWidget {
  const Cart_scrren({Key? key}) : super(key: key);

  @override
  State<Cart_scrren> createState() => _Cart_scrrenState();
}

 
class _Cart_scrrenState extends State<Cart_scrren> {

  List<Cart_item_model> cart_item= [
    Cart_item_model(id: 1, name:"Grapes", price: 152.00, quantity: 1, totalPrice: 152),
    Cart_item_model(id: 2, name:"Tomato", price: 152.00, quantity: 1, totalPrice: 152),
    Cart_item_model(id: 3, name:"Brinjal", price: 152.00, quantity: 1, totalPrice: 152),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 53,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custom_Text("Cart", fontSize: 25,),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart_item.length,
                  itemBuilder: (context , index) => Cart_Items(cart_item_model: cart_item[index]),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(top: 30,right: 50,left: 50),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Custom_AmmountRow(text: "Item Total",price: "20.49",),
              SizedBox(
                height: 12,
              ),
              Custom_AmmountRow(text: "Discount",price: "-10.00",),
              SizedBox(
                height: 12,
              ),
              Custom_AmmountRow(text: "Tex",price: "0.00",),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custom_Text("Total",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),
                  Custom_Text("Rs.${20.49}",color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Custom_Button(onTap: ()=> UtilFuntions.navigateTo(context, Success()), text:"Place Order"),
            ],
          ),
        ),
      ),
    );
  }
}



