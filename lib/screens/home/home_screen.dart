import 'package:flutter/material.dart';
import 'package:grocery/components/cart_button.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/Vegitable.dart';
import 'package:grocery/models/model_providers/singin_provider.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/screens/cart/cart.dart';
import 'package:grocery/screens/home/product_grid.dart';
import 'package:grocery/screens/main/favouritse/favouritse.dart';
import 'package:grocery/screens/profile/profile.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:provider/provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final List<Product_Model> vegitables = [
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            children: [
              SizedBox(
                height: 43.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsPath.menuicon),
                  Row(
                    children: [
                      Consumer<Singin_Provider>(builder: (context,value,child) {
                        return IconButton(onPressed: (){
                          value.signOut();
                        }, icon: Icon(Icons.logout),);
                      }),
                      Cart_Button(),
                    ],
                  )

                ],
              ),
              SizedBox(
                height: 38.0,
              ),
              Custom_Text(
                "Vegetables",
                fontSize: 20.0,
              ),
              SizedBox(
                height: 41.0,
              ),
              Product_Grid(),
            ],
          ),
        ),
      ),
    );
  }
}


