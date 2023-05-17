

import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/user_model.dart';

class Oder_Model{
  String id;
  User_Model user;
  double total;
  List<Cart_item_model> item;
  String status;

  Oder_Model(this.id,this.user,this.total,this.item,this.status);

  //--------------- bind user data our model
  Oder_Model.fronJson(Map<String , dynamic> json)
      : id = json["id"],
        user = User_Model.fronJson(json["user"] as Map<String,dynamic>),
        total = (json["total"] as num).toDouble(),
        item = (json["item"] as List<dynamic>).map((e) => Cart_item_model.fronJson(e as Map<String,dynamic>)).toList(),
        status = json["status"];

//   Map<String,dynamic> toJson() =>{
//   "uid" : id,
//   "user" : user,
//   "total" : total,
//   "item" : item,
//     "status" : status,
// };
}