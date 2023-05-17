
import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/model_providers/home/product_provider.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/screens/main/favouritse/widgets/fev_item.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:provider/provider.dart';

class Favouritse extends StatefulWidget {
  const Favouritse({Key? key}) : super(key: key);

  @override
  State<Favouritse> createState() => _FavouritseState();
}

class _FavouritseState extends State<Favouritse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
              children: [
                Custom_Text("favouritse",fontSize: 30,),
                Expanded(
                    child: Consumer<Product_Provider>(builder: (context,value, child){
                      return value.favouritseProduct.isEmpty? Center(child: Custom_Text("No favouritse items")):ListView.separated(itemBuilder: (context , index) {
                        return Favouritse_Item(product_model: value.favouritseProduct[index]);
                      } , separatorBuilder: (context , index){
                        return SizedBox(height: 10,);
                      }, itemCount: value.favouritseProduct.length);
                    }),
                  ),
              ],
            )),
      ),
    );
  }
}
