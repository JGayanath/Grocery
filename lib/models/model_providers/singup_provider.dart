

import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grocery/controllers/auth_controller.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:logger/logger.dart';

class Singup_Provider extends ChangeNotifier {

  Auth_Controler auth_controler = Auth_Controler();

  //-- name controller
  final _name = TextEditingController();
  //--- get name controller
  TextEditingController get nameController => _name;


  //-- email controller
  final _email = TextEditingController();
  //--- get email controller
  TextEditingController get emailController => _email;


  //-- password controller
  final _password = TextEditingController();
  //--- get password controller
  TextEditingController get passwordController => _password;

  // loading state
  bool _isLoader = false;

  //--- return loading state
  bool get isLoading => _isLoader;

  // set loading state
  set loader(bool value){
    _isLoader=value;
    notifyListeners();
  }



  Future<void> stratSingUp (BuildContext context) async {
    try{
      if (_email.text.isNotEmpty && _password.text.isNotEmpty && _name.text.isNotEmpty) {

        //-- before singup
        loader=true;

       await auth_controler.singUpUser(_email.text,_password.text,_name.text,context,);

        //-- after singup
        loader=false;

      } else {
        AlertHelper.alertDialog(context, DialogType.error , "Validation Error", "Fill all the fields");
        
      }

    }catch(e){
      Logger().e(e);
      loader=false;
    }
  }
}