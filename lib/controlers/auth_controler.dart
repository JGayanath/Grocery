
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/screens/auth/sing_up.dart';
import 'package:grocery/screens/home/home_screen.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:grocery/utils/util_funtions.dart';
import 'package:logger/logger.dart';

class Auth_Controler{
  Future<void> initializeUser(BuildContext context) async{
    // check user's currently auth state
    //register this lisner
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        //if the user object is null
        // can be user not sin in or sing out
        Logger().i("User is currently signed out!");
        UtilFuntions.navigateTo(context, SingUp());
      } else {
        //if the user object is not null
        Logger().i("User is signed in!");
        UtilFuntions.navigateTo(context, Home_Screen());
      }
    });
  }
  // sing up user
  static Future<void> singUpUser(String email , String password,BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.code);

    } catch (e) {
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.toString());
      Logger().e(e);
    }
  }

  // sign in up user
  static Future<void> signInUser(String email , String password,BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.code);
    } catch (e) {
      Logger().e(e);
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.toString());
    }
  }

  static Future<void> sendPasswordResetEmail(String email,BuildContext context) async{
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email:
        email,
      );
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.code);
    } catch (e) {
      Logger().e(e);
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.toString());
    }
  }

}