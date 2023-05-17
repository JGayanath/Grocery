



import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery/controllers/admin_controller.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:logger/logger.dart';

class Product_Provider extends ChangeNotifier{

  //-------- admin controller object
  final Admin_Contriller admin_contriller = Admin_Contriller();


  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value) {
    _isLoader = value;
    notifyListeners();
  }


  // ---store product list
  List<Product_Model> _product = [];

  //---- get products
  List<Product_Model> get product => _product;

  //-------------------start fatch product
  Future<void> startFatchProduct() async {
    try {
      //--- star loader
      loader = true;

      _product = await admin_contriller.fatchProductList();
      notifyListeners();

      //---end loader
      loader = false;
    } catch (e) {
      Logger().e(e);
      //---end loader
      loader = false;
    }
  }

  // ---view favouritse product list
  List<Product_Model> _favouritseProduct = [];

  //---- get favouritse products
  List<Product_Model> get favouritseProduct => _favouritseProduct;

  //---- add to favouritse

  void addFavouritse(Product_Model model , BuildContext context){
    //----- first check whether this product alrady in favourites list
    if(_favouritseProduct.contains(model)){
      //--- if the exsist remove prodct fom the list
      _favouritseProduct.remove(model);
      //show snack bar
      AlertHelper.showSnackBar(context, "Remove from favourites", AnimatedSnackBarType.error);
      notifyListeners();

    }else{
      _favouritseProduct.add(model);
      Logger().w(favouritseProduct.length);
      AlertHelper.showSnackBar(context, "Added to favourites", AnimatedSnackBarType.success);
      notifyListeners();
    }
  }

  //----romove from favouritse
  void removeFovourites(Product_Model model , BuildContext context){
    _favouritseProduct.remove(model);
    AlertHelper.showSnackBar(context, "Remove from favourites", AnimatedSnackBarType.error);
    notifyListeners();
  }

  late Product_Model _product_Model;

  Product_Model get product_Model => _product_Model;

  set productModel(Product_Model value){
    _product_Model=value;
    notifyListeners();
  }

  //---- get related product without selected product
  List<Product_Model> get relatedProduct{
    List<Product_Model> temp = [];

    // filtering the product list and remove and add alrady selected product
    for(var i=0 ; i<_product.length ; i++){
      if(_product[i] != product_Model){
        temp.add(_product[i]);
      }
    }
    return temp;
  }
}