import 'package:flutter/material.dart';
import 'package:grocery/components/custom_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/Vegitable.dart';
import 'package:grocery/screens/home/product_details/widgets/counter_section.dart';
import 'package:grocery/screens/home/product_details/widgets/related_products.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';

class Product_Details extends StatefulWidget {
  const Product_Details({
    required this.vegitable,
    Key? key,
  }) : super(key: key);

  final Vegitable vegitable;

  @override
  State<Product_Details> createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: const Color(0xFFEEE0F8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 31.0),
                          child: IconButton(
                            onPressed: () => UtilFuntions.backToPage(context),
                            icon: Icon(Icons.navigate_before),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Image.asset(
                        widget.vegitable.image,
                        width: 188,
                        height: 188,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 258,
                      child: Container(
                        margin: EdgeInsets.only(top: 28),
                        padding:
                            EdgeInsets.only(top: 34.0, left: 29.0, right: 30.0),
                        width: size.width,
                        //height: size.height,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(34.0),
                            topRight: Radius.circular(34.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Custom_Text(
                                  "${widget.vegitable.name}",
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 2),
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black12,
                                  ),
                                  child: Counter_Section(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Custom_Text(
                                  "Rs. ${widget.vegitable.price} " "/kg",
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Custom_Text("${widget.vegitable.dsc}",
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.justify),
                            const SizedBox(
                              height: 26,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Custom_Text(
                                "Related items",
                                fontSize: 14,
                                color: AppColors.prymeryColor,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Related_Products(),
                            SizedBox(
                              height: 65,
                            ),
                            Custom_Button(onTap:()=>null, text: "Add to cart"),
                            SizedBox(
                              height: 74,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


