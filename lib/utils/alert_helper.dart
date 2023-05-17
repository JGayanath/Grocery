
import 'package:animated_snack_bar/animated_snack_bar.dart';
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

  //------- show a snack bar
  static void showSnackBar(BuildContext context , String msg ,AnimatedSnackBarType type){
    AnimatedSnackBar.material(
      msg,
      type: type,
      duration: Duration(seconds: 1),
    ).show(context);
  }

}