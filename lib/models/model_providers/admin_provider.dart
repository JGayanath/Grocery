import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery/controllers/admin_controller.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class Admin_Provider extends ChangeNotifier {
  //-------- admin controller object
  final Admin_Contriller admin_contriller = Admin_Contriller();

  //----- image picker class object
  final ImagePicker _picker = ImagePicker();

  //---- product image object
  File _image = File("");

  //--- get picker file
  File get image => _image;

  //---select product image
  Future<void> selectImage() async {
    try {
      // Pick an image
      _image = await UtilFuntions.pickerImageFromGallery();
      notifyListeners();
    } catch (e) {
      Logger().e(e);
    }
  }

  //-- product name controller
  final _productName = TextEditingController();
  //--- get name controller
  TextEditingController get productNameController => _productName;

  //-- product description controller
  final _descriptionProduct = TextEditingController();
  //--- get email controller
  TextEditingController get descriptionProductController => _descriptionProduct;

  //-- price controller
  final _price = TextEditingController();
  //--- get password controller
  TextEditingController get priceController => _price;

  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value) {
    _isLoader = value;
    notifyListeners();
  }

  //-----------start saving product data
  Future<void> startSaveProductData() async {
    try {
      //--- star loader
      loader = true;

      await admin_contriller
          .saveProductData(
              _productName.text, _descriptionProduct.text, _price.text, _image)
          .then((value) {
        _productName.clear();
        _descriptionProduct.clear();
        _price.clear();
        _image = File("");
        notifyListeners();
      });
      //---end loader
      loader = false;
    } catch (e) {
      Logger().e(e);
      //---end loader
      loader = false;
    }
  }
}
