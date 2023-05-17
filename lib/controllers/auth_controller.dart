
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/controllers/fileupload_controller.dart';
import 'package:grocery/models/user_model.dart';
import 'package:grocery/utils/alert_helper.dart';
import 'package:grocery/utils/assets_constant.dart';
import 'package:logger/logger.dart';

class Auth_Controler{

  // sing up user
   Future<void> singUpUser(String email , String password, String name,BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(credential!=null){
        //----- save extra data in firestore
        saveUserData(credential.user!.uid,email,password,name);
      }


      Logger().i(credential);
    } on FirebaseAuthException catch (e) {
      Logger().e(e.code);
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.code);

    } catch (e) {
      AlertHelper.alertDialog(context, DialogType.error , "Error", e.toString());
      Logger().e(e);
    }
  }

  //----- save user data in firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //----- save data in firestore for referance
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  //----- save extra data in firestore
  Future<void> saveUserData(String uid , String email , String password, String name) {
    return users
        .doc(uid)
        .set({
      'email': email ,
      'passwor' : password,
      'name' : name,
      'userid': uid,
      'image' : AssetsPath.dumyProfile,
    })
        .then((value) => Logger().i("User added"))
        .catchError((error) => Logger().e("Fail to added user : $error"));
  }

  //-----------fatch user data from cloud firestore
  Future<User_Model?> fatchUserData(String uid) async{
    try{
      //-------user data fatch according to the uid
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();

      Logger().i(documentSnapshot.data());


      //-----------------mapping fatch user data in to usermodel
      User_Model user_model=User_Model.fronJson(documentSnapshot.data() as Map<String , dynamic>);
      return user_model;

    }catch(e){
      Logger().e(e);
      return null;
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

  FileUploadController fileUploadController = FileUploadController();

  //---- upload pick image file to firebase store
  Future<String> uploadAndUpdateProfileImage(File file , String uid) async{
    try{
      //---- first upload image and get download url link
      String downloadUrl = await fileUploadController.uploadFile(file, "profileImage");
      if(downloadUrl != "" ){
        //---- update url alrady url in the user data
        await users.doc(uid).update({
          'image' : downloadUrl,
        });
        return downloadUrl;
      }else{
        Logger().e("Download url is empty");
        return "";
      }
    }catch(e){
      Logger().e(e);
      return "";
    }

  }

}