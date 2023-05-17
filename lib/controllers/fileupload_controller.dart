

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';


class FileUploadController{

  Future<String> uploadFile(File file , String folderPath) async {
    try{
      // getting the file name from the file path
      final String fileName = basename(file.path);

      // defining the firebase storage distination
      final String distination = "$folderPath/$fileName";

      // creating the firebase storage referance  with the destination  file location
      final ref = FirebaseStorage.instance.ref(distination);

      // upload file
      UploadTask task = ref.putFile(file);

      // wait the until uploading task is complete
      final snapshot = await task.whenComplete(() {

      });

      // getting the download url of the uload file
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;

    }catch(e){
      //Logger().e(e);
      return "";
    }
  }
}

