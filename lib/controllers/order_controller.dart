

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/controllers/fileupload_controller.dart';
import 'package:grocery/models/cart_item_model.dart';
import 'package:grocery/models/oder_model.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/models/user_model.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class Oder_Controller{


  //----- save oder data in firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //----- create cllection referance called user that referancess firestore collection
  CollectionReference oders = FirebaseFirestore.instance.collection('orders');


  //----- save product data firestore
  Future<void> saveOderData(User_Model user , double total, List<Cart_item_model> item) async {

    //--tempery
    var list = [];

    //-- read the cart item list and add items to a dynamic list
    // becouse we can only store dynamic type array list in to firestore

    for(int i = 0 ; i < item.length ; i++){
      list.add(item[i].toJson());
    }

    await oders
        .add({
      'id' : const Uuid().v1(),
      'user': user.toJson(),
      'total' : total,
      'item' : list,
      'status': "pending",

    })
        .then((value) => Logger().i("Oder created"))
        .catchError((error) => Logger().e("Fail to create oder : $error"));
  }

  //-----------fatch oder data from cloud firestore
  Future<List<Oder_Model>> fatchOderList(String uid) async {
    try {
      //------firebase query that find and ftach oder docs
      QuerySnapshot querySnapshot = await oders.where("user.uid" , isEqualTo: uid).get();

      Logger().i(querySnapshot.docs.length);

      List<Oder_Model> list = [];

      for (var e in querySnapshot.docs) {
        Oder_Model model = Oder_Model.fronJson(
            e.data() as Map<String, dynamic>);
        list.add(model);
      }

      return list;
    } catch (e) {
      //Logger().e(e);
      return [];
    }
  }



}