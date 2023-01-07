
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class AlertHelper{

  static Future<void> alertDialog(BuildContext context , DialogType dialogType , String title , String desc ) async{
    AwesomeDialog(
      //Show error dioalog
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title ,
      desc:  desc,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )
      ..show();
  }

}