

import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/controllers/auth_controller.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class Singin_Provider extends ChangeNotifier {


  //-- email controller
  final _email = TextEditingController();
  //--- get email controller
  TextEditingController get emailController => _email;


  //-- password controller
  final _password = TextEditingController();
  //--- get password controller
  TextEditingController get passwordlController => _password;



  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value){
    _isLoader=value;
    notifyListeners();
  }



  Future<void> stratSingIn (BuildContext context) async {
    try{
      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {

        //-- before singin
        loader=true;

        await Auth_Controler.signInUser(_email.text, _password.text,context);

        //-- after singin
        loader=false;

      } else {
        AlertHelper.alertDialog(context, DialogType.error , "Validation Error", "Fill all the fields");

      }

    }catch(e){
      Logger().e(e);
      loader=false;
    }
  }


  //-- resetpasswordemail controller
  final _resetpassworemail = TextEditingController();
  //--- get email controller
  TextEditingController get resetpassworemailController => _resetpassworemail;


  Future<void> stratsendPasswordResetEmail(BuildContext context) async {
    try{
      if (_resetpassworemail.text.isNotEmpty) {

        //-- before sendemail
        loader=true;

        await Auth_Controler.sendPasswordResetEmail(_resetpassworemail.text,context);

        //-- after sentemail
        loader=false;

      } else {
        AlertHelper.alertDialog(context, DialogType.error , "Validation Error", "Fill all the fields");
      }

    }catch(e){
      Logger().e(e);
      loader=false;
    }
  }

  //----- sign out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}