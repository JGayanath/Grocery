

import 'package:grocery/models/product_model.dart';

class Cart_item_model{
  String id;
  double subTotal;
  int quantity;
  Product_Model product_Model;

  Cart_item_model({required this.id,required this.subTotal , required this.quantity , required this.product_Model });

  Cart_item_model.fronJson(Map<String, dynamic> json)
      : id = json["id"],
        subTotal = (json["subTotal"]as num).toDouble(),
        quantity = (json["quantity"]as num).toInt(),
        product_Model = Product_Model.fronJson(json["product_Model"] as Map<String,dynamic>);

  Map<String, dynamic> toJson() => {
    "id": id,
    "subTotal": subTotal,
    "quantity": quantity,
    "product_Model": product_Model.toJson(),
  };

}