

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery/controllers/fileupload_controller.dart';
import 'package:grocery/models/product_model.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';

class Admin_Contriller{


  //----- save user data in firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //----- create cllection referance called user that referancess firestore collection
  CollectionReference products = FirebaseFirestore.instance.collection('products');


  //--- file upload controller object
  final FileUploadController fileUploadController = FileUploadController();


  //----- save product data firestore
  Future<void> saveProductData(String productName , String productDesc , String price , File file) async {

    //---- uploading the product select image
    final String uploadImageUrl = await fileUploadController.uploadFile(file, "productImages");

    if(uploadImageUrl != null){
      try{
        await products
            .add({
          'id' : const Uuid().v1(),
          'productName': productName ,
          'productDesc' : productDesc,
          'price' : price,
          'image': uploadImageUrl,

        })
            .then((value) => Logger().i("Product added"))
            .catchError((error) => Logger().e("Fail to added product : $error"));

      }catch(e){
        Logger().e(e);
      }
    }else{
      Logger().e("Something went wrong");
    }
  }

  //-----------fatch product data from cloud firestore
  Future<List<Product_Model>> fatchProductList() async {
    try {
      //------firebase query that find and ftach product docs
      QuerySnapshot querySnapshot = await products.get();

      Logger().i(querySnapshot.docs.length);

      List<Product_Model> list = [];

      for (var e in querySnapshot.docs) {
        Product_Model model = Product_Model.fronJson(
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