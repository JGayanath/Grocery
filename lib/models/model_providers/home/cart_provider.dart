import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class Cart_Provider extends ChangeNotifier {
  //---- item counter
  int _counter = 1;

  //---het conter
  int get counter => _counter;

  //---- increase counter
  void increaseCounter() {
    _counter++;
    notifyListeners();
  }

  //---- decrease counter
  void decreaseCounter() {
    if (_counter != 1) {
      _counter--;
      notifyListeners();
    }
  }

  //---- clear counter
  void clearCounter() {
    _counter = 1;
    notifyListeners();
  }

  //----- add to cart

  //--- initialize list cart item model
  List<Cart_item_model> _cartItem = [];

  // --- get cart item
  List<Cart_item_model> get cartItem => _cartItem;

  //----- add to cart mothord
  void AddToCart(Product_Model model, BuildContext context) {
    //------first check wether adding product alraddy in the cart item list
    if (_cartItem.any((e) => e.id == model.id)) {
      increaseCartItemCount(context, _counter, model);
    } else {
      //----- adding an item to cart
      _cartItem.add(Cart_item_model(
          id: model.id,
          subTotal: _counter * double.parse(model.price),
          quantity: _counter,
          product_Model: model));

      Logger().w(_cartItem.length);

      //--- clear the counter
      clearCounter();

      //---- show snack bar
      AlertHelper.showSnackBar(
          context, "Add to cart", AnimatedSnackBarType.success);

      notifyListeners();
    }
    // Logger().w(_cartItem.length);
    // Logger().w(_cartItem.first.quantity);
  }

  //----calculate and get cart item count
  int get getCartItemCount {
    //--- read the cart items and get the sum of quanties as the cart total items counts
    int temp = 0;
    for (var i = 0; i < _cartItem.length; i++) {
      temp = temp + _cartItem[i].quantity;
    }
    return temp;
  }
  //-----increase cart item count
  void increaseCartItemCount(BuildContext context , int quantity , Product_Model model){
    //----if exists the, increase the product amount and sub total of  the item
    var temp = _cartItem.firstWhere((e) => e.id == model.id);

    //temp.quantity = temp.quantity+_counter;
    temp.quantity += quantity;

    //---- then update the subtotal also
    temp.subTotal = temp.quantity * double.parse(model.price);

    AlertHelper.showSnackBar(context, "Increased the product ammount",
        AnimatedSnackBarType.success);
    //--- clear the counter
    clearCounter();
    notifyListeners();

  }

  //-----decrease cart item count
  void decreaseCartItemCount(BuildContext context , int quantity , Product_Model model){
    //----if exists the, decrease the product amount and sub total of  the item
    var temp = _cartItem.firstWhere((e) => e.id == model.id);

    // first check wether the item quantity greater than 1

    if(temp.quantity==1){
      // if yes remove the cart item from list
      removeCartItem(model.id , context);
    }else {
      temp.quantity -= quantity;

      //---- then update the subtotal also
      temp.subTotal = temp.quantity * double.parse(model.price);

      AlertHelper.showSnackBar(context, "Increased the product ammount",
          AnimatedSnackBarType.success);
      //--- clear the counter
      clearCounter();
      notifyListeners();
    }
  }

  void removeCartItem(String cartItemId , BuildContext context){
    _cartItem.removeWhere((element) => element.id==cartItemId);
    AlertHelper.showSnackBar(context, "Remove from the cart",
        AnimatedSnackBarType.success);
    notifyListeners();
  }

  //----calculate and get cart item Total
  double get getCartItemTotal {
    //--- read the cart items and get the sum of quanties as the cart total
    double temp = 0;
    for (var i = 0; i < _cartItem.length; i++) {
      temp = temp + _cartItem[i].subTotal;
    }
    return temp;
  }

}
