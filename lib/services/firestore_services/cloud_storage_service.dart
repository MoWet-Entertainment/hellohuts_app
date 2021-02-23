import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class CloudStorageService {
  Future<CloudStorageResult> uploadFile({
    @required File fileToUpload,
    @required String title,
  }) async {
    var fileName = title + DateTime.now().millisecondsSinceEpoch.toString();
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(fileToUpload);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
    var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return CloudStorageResult(
        fileUrl: url,
        fileName: fileName,
      );
    }
    return null;
  }

  Future deleteImage(String fileName) async {
    final StorageReference firebaseStorage =
        FirebaseStorage.instance.ref().child(fileName);
    try {
      await firebaseStorage.delete();
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
