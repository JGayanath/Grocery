import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/models/model_providers/home/oder_provider.dart';
import 'package:grocery/screens/cart/success.dart';
import 'package:grocery/screens/cart/widgets/cart_items.dart';
import 'package:grocery/screens/cart/widgets/custom_ammountrow.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';

class Cart_scrren extends StatefulWidget {
  const Cart_scrren({Key? key}) : super(key: key);

  @override
  State<Cart_scrren> createState() => _Cart_scrrenState();
}

class _Cart_scrrenState extends State<Cart_scrren> {
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
                Custom_Text(
                  "Cart",
                  fontSize: 25,
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: Consumer<Cart_Provider>(builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.cartItem.length,
                  itemBuilder: (context, index) =>
                      Cart_Items(cart_item_model: value.cartItem[index]),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 250,
        child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
            child: Consumer<Cart_Provider>(builder: (context, value, child) {
              return Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Custom_AmmountRow(
                    text: "Item Total",
                    price: value.getCartItemCount.toString(),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Custom_AmmountRow(
                    text: "Discount",
                    price: "-10.00",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Custom_AmmountRow(
                    text: "Tex",
                    price: "0.00",
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom_Text(
                        "Total",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      Custom_Text(
                        "Rs.${value.getCartItemTotal}",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Custom_Button(
                  isLoader:Provider.of<OderProvider>(context).isLoading,
                      onTap: () =>
                          // UtilFuntions.navigateTo(
                          //   context,
                          //   Success(),
                          // ),
                      Provider.of<OderProvider>(context,listen: false).stratCreateOder(context),
                      text: "Place Order"),
                ],
              );
            })),
      ),
    );
  }
}
