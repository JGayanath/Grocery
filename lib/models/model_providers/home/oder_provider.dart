
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery/controllers/order_controller.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/model_providers/home/cart_provider.dart';
import 'package:grocery/models/model_providers/user_provider.dart';
import 'package:grocery/models/oder_model.dart';
import 'package:grocery/models/user_model.dart';
import 'package:grocery/screens/cart/success.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class OderProvider extends ChangeNotifier{
  Oder_Controller oder_controller = Oder_Controller();

  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value) {
    _isLoader = value;
    notifyListeners();
  }

  Future<void> stratCreateOder(BuildContext context) async{
    try{
      //----get user model
      User_Model user = Provider.of<User_Provider>(context,listen: false).userModel!;

      //----get cart item
      List<Cart_item_model> item = Provider.of<Cart_Provider>(context,listen: false).cartItem;

      //----get cart item total
      double total = Provider.of<Cart_Provider>(context,listen: false).getCartItemTotal;

      //---first check is whether the cart item not empty
      if(item.isNotEmpty){
        loader = true;

        await oder_controller.saveOderData(user, total, item);

        loader=false;
        UtilFuntions.navigateTo(context, Success());
      }else{
        AlertHelper.alertDialog(context, DialogType.info, "Ops", "You must add some item to the cart",);
      }

    }catch(e){
      Logger().e(e);
    }
  }

  // ---store oder list
  List<Oder_Model> _oders = [];

  //---- get products
  List<Oder_Model> get oders => _oders;

  //-------------------start fatch product
  Future<void> startFatchOders(BuildContext context) async {
    //----get user model
    User_Model user = Provider.of<User_Provider>(context,listen: false).userModel!;
    try {
      //--- star loader
      loader = true;

      _oders = await oder_controller.fatchOderList(user.uid);
      notifyListeners();

      //---end loader
      loader = false;
    } catch (e) {
      Logger().e(e);
      //---end loader
      loader = false;
    }
  }

}