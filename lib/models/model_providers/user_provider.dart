

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/controllers/auth_controller.dart';
import 'package:grocery/models/model_providers/admin_provider.dart';
import 'package:grocery/models/model_providers/home/oder_provider.dart';
import 'package:grocery/models/model_providers/home/product_provider.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/models/user_model.dart';
import 'package:grocery/screens/auth/sing_up.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/screens/main/main_screen.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class User_Provider extends ChangeNotifier {

  final Auth_Controler _auth_controler = Auth_Controler();


  //------------initiallize user
  Future<void> initializeUser(BuildContext context) async{
    // check user's currently auth state
    //register this lisner
    await FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        //if the user object is null
        // can be user not sin in or sing out
        Logger().i("User is currently signed out!");
        UtilFuntions.navigateTo(context, SingUp());
      } else {
        //if the user object is not null
        Logger().i("User is signed in!");
        await startFatchData(user.uid,context).then((value) {
          //----start fetch product before open home page
          Provider.of<Product_Provider> (context,listen: false).startFatchProduct();
          //--fetch oder
          Provider.of<OderProvider>(context,listen: false).startFatchOders(context);
          UtilFuntions.navigateTo(context, Main_Screen());
        });
      }
    });
  }

  //------------ store fatch user data
  User_Model? _user_Model;

  User_Model? get  userModel => _user_Model;


  //------start fatchinh user data
  Future<void> startFatchData(String uid,BuildContext context) async{
    try{
      await _auth_controler.fatchUserData(uid).then((value) {
        //---------------- check facth data not null
        if(value!=null){
          _user_Model=value;
          notifyListeners();
        }else{
          AlertHelper.alertDialog(context, DialogType.error, "Error","Error while fatching user data");
        }
      });
    }catch(e){
      Logger().e(e);
    }
  }

  //---- product image object
  File _image = File("");

  //--- get picker file
  File get image => _image;

  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value){
    _isLoader=value;
    notifyListeners();
  }


  Future<void> selectAndUploadProfileImage() async {
    try {
      // Pick an image
      _image = await UtilFuntions.pickerImageFromGallery();

      if(_image.path != ""){
        // start loader
        loader=true;

        String imageUrl = await _auth_controler.uploadAndUpdateProfileImage(_image, userModel!.uid);

        if(imageUrl != "" ){
          userModel!.image = imageUrl;
          notifyListeners();

          //--stop loader
          loader=false;
        }
        //--stop loader
        loader=false;
      }

    } catch (e) {
      Logger().e(e);
      //--stop loader
      loader=false;
    }
  }



}