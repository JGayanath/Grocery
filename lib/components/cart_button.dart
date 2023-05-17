import 'package:flutter/material.dart';
import 'package:grocery/components/custom_text.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/screens/cart/cart.dart';
import 'package:grocery/utils/app_colors.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class Cart_Button extends StatelessWidget {
  const Cart_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart_Provider>(builder: (context , value , child){
      return badges.Badge(
        badgeContent: Custom_Text(value.getCartItemCount.toString(),fontSize: 12,color: AppColors.whiteColor,fontWeight: FontWeight.bold,),
        badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.prymeryColor),
        child:InkWell(
            onTap: (){
              UtilFuntions.navigateTo(context, Cart_scrren());
            },
            child: Image.asset(AssetsPath.carticon)),
      );
    });


  }
}
