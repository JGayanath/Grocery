
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/Vegitable.dart';
import 'package:grocery/screens/home/product_details/product_details.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';

class Product_Grid extends StatelessWidget {
 Product_Grid({
    Key? key,
  }) : super(key: key);

  final List<Vegitable> vegitable = [
    Vegitable(id: 1, name: "Pumking", price: 150 , image: AssetsPath.pumking,),
    Vegitable(id: 2, name: "Tomato", price: 150 , image: AssetsPath.tomato ),
    Vegitable(id: 3, name: "Brinjal", price: 150 , image: AssetsPath.brinjal),
    Vegitable(id: 4, name: "Cauliflower", price: 120 , image: AssetsPath.cauliflower),
    Vegitable(id: 5, name: "Potato", price: 150 , image: AssetsPath.item1),
    Vegitable(id: 6, name: "Broccoli", price: 140 , image: AssetsPath.item2),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 44,
      ),
        itemCount: 6,
        itemBuilder: (context , index) => InkWell(
          onTap: () {
            UtilFuntions.navigateTo(context, Product_Details(vegitable: vegitable[index]));
            },
          child: Container(
            //padding: EdgeInsets.symmetric(horizontal: 17),
            height: 177,
            decoration: BoxDecoration(
              color: Color(0xffEBF8EE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10.0,),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: EdgeInsets.only(right: 17.0,top: 7.0),
                        child: Icon(Icons.favorite_border_outlined))),
                Image.asset(vegitable[index].image),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  height: 38.0,
                  decoration: BoxDecoration(
                    color: AppColors.prymeryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom_Text(vegitable[index].name,fontSize: 15,color: Colors.white,),
                      Custom_Text("Rs. ${vegitable[index].price.toString()}.00",fontSize: 10,color: Colors.black,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}