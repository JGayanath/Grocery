import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/Vegitable.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/models/model_providers/home/product_provider.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:provider/provider.dart';

class Related_Products extends StatelessWidget {
  Related_Products({
    Key? key,
  }) : super(key: key);

  // final List<Vegitable> vegitable = [
  //   Vegitable(id: 1, name: "Pumking", price: 150, image: AssetsPath.pumking,
  //   ),
  //   Vegitable(id: 2, name: "Tomato", price: 150, image: AssetsPath.tomato),
  //   Vegitable(id: 3, name: "Brinjal", price: 150, image: AssetsPath.brinjal),
  //   Vegitable(
  //       id: 4, name: "Cauliflower", price: 120, image: AssetsPath.cauliflower),
  //   Vegitable(id: 5, name: "Potato", price: 150, image: AssetsPath.item1),
  //   Vegitable(id: 6, name: "Broccoli", price: 140, image: AssetsPath.item2),
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Consumer<Product_Provider>(builder: (context , value ,child){
        return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => InkWell(
              onTap:  () {
                //--- clear counter
                Provider.of<Cart_Provider>(context ,listen: false).clearCounter();
                value.productModel = value.relatedProduct[index];
              },
              child: Container(
                  width: 83,
                  height: 83,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF1FFF2),
                    image: DecorationImage(image: NetworkImage(value.relatedProduct[index].image),
                      fit:BoxFit.fitWidth,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Custom_Text("${value.relatedProduct[index].productName}",color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,),
                            Custom_Text("${value.relatedProduct[index].price.toString()}",color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,)
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
            separatorBuilder: (context, index) =>
                SizedBox(
                  width: 21,
                ),
            itemCount: value.relatedProduct.length);
      }),
    );
  }
}