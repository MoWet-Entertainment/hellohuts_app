import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';

class CloudStorageService {
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;



      
  Future<CloudStorageResult> uploadFile({
    @required File fileToUpload,
    @required String title,
  }) async {
    var fileName = title + DateTime.now().millisecondsSinceEpoch.toString();
    

    firebase_storage.UploadTask uploadTask =  _storage.ref().child(fileName).putFile(fileToUpload);
    var downloadUrl = await (await uploadTask).ref.getDownloadURL();

      var url = downloadUrl.toString();
      return CloudStorageResult(
        fileUrl: url,
        fileName: fileName,
      );
    }

  

  Future deleteImage(String fileName) async {

    try {
      await _storage.ref().child(fileName).delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}

class CloudStorageResult {
  final String fileUrl;
  final String fileName;

  CloudStorageResult({this.fileUrl, this.fileName});
}
