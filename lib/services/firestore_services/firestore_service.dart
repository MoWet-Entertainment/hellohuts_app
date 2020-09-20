import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/app_user.dart';
import 'package:hellohuts_app/models/user_feed/feed.dart';
import 'package:hellohuts_app/services/firestore_services/firestore_path.dart';
import 'package:hellohuts_app/helper/logger.dart';
import 'package:meta/meta.dart';

class FirestoreService {
  var logger = getLogger('FirestoreService');
  FirestoreService._();
  static final instance = FirestoreService._();
  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection(FirestorePath.users);

  final CollectionReference _postsCollectionReference =
      FirebaseFirestore.instance.collection(FirestorePath.posts);

  final StreamController<List<FeedModel>> _postController =
      StreamController<List<FeedModel>>.broadcast();

  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data);
  }

  Future<void> deleteData({
    @required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentId),
    Query queryBuilder(Query query),
    int sort(T lhs, T rhs),
  }) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(
                snapshot.data,
                snapshot.documentID,
              ))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentId),
  }) {
    final DocumentReference reference = Firestore.instance.document(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(
          snapshot.data,
          snapshot.documentID,
        ));
  }

  Future<bool> checkUserIsPresent(FirebaseUser user) async {
    final snapShot =
        await Firestore.instance.collection('users').document(user.uid).get();
    if ((snapShot == null || !snapShot.exists)) {
      return false;
    }
    return true;
  }

  Future createUser(AppUser user) async {
    final snapShot =
        await Firestore.instance.collection('users').document(user.uid).get();
    if ((snapShot == null || !snapShot.exists)) {
      try {
        await _userCollectionReference
            .document(user.uid)
            .setData(user.toJson());
        logger.d('New user is Created  in Firestore with uid:' + user.uid);
      } catch (e) {
        if (e is PlatformException) {
          return e;
        }
        return e.toString();
      }
    } else {
      logger.d('User already exists in Firestore');
    }
  }

  Future<AppUser> getUser(String uid) async {
    try {
      var userData = await _userCollectionReference.document(uid).get();
      print(userData.data);
      logger.d('Fetched user data from Firestore for uid:' + uid);
      print(AppUser.fromJson((userData.data)));
      return AppUser.fromJson(userData.data);
    } catch (error) {
      print(error);
      logger.e('Error in Get User');
    }
    return null;
  }

  Future addPost(FeedModel model) async {
    try {
      await _postsCollectionReference.add(model.toJson());
    } catch (error) {
      cprint('Error occured while adding post');
      throw error;
    }
  }

  Future getPostsOnceOff() async {
    try {
      var postDocumentsSnapshot =
          await _postsCollectionReference.getDocuments();
      if (postDocumentsSnapshot.documents.isNotEmpty) {
        return postDocumentsSnapshot.documents
            .map((snapshot) => FeedModel.fromJson(snapshot.data))
            .where((mappedItem) => mappedItem.title != null)
            .toList();
      } else {
        return null;
      }
    } catch (error) {
      cprint('Error occured while fetching posts');
      throw error;
    }
  }

  Stream listenToPostRealTime() {
    _postsCollectionReference.snapshots().listen((postSnapshot) {
      if (postSnapshot.documents.isNotEmpty) {
        var posts = postSnapshot.documents
            .map((snapshot) => FeedModel.fromJson(snapshot.data))
            .where((mappedItem) => mappedItem.isValidPost)
            .toList();
        _postController.add(posts);
      }
    });
    return _postController.stream;
  }

  Future deletePost(String documentId) async {
    try {
      await _postsCollectionReference.document(documentId).delete();
    } catch (error) {
      cprint("Could not delete the post");
      throw error;
    }
  }

  Future updatePost(FeedModel model) async {
    try {
      await _postsCollectionReference
          .document(model.key)
          .setData(model.toJson());
      cprint('Post updated');
    } catch (error) {
      cprint(error, errorIn: 'updatePost');
      throw error;
    }
  }

  Future updateLike(FeedModel model, String userId) async {
    try {
      await _postsCollectionReference
          .document(model.key)
          .collection(AppFeedConstants.postLikeList)
          .document(userId)
          .setData({AppFeedConstants.userId: userId});
    } catch (error) {
      cprint(error, errorIn: 'updateLike');
      throw error;
    }
  }

  Future getPostDetail(String postId) async {
    try {
      var postData = await _postsCollectionReference.document(postId).get();
      if (postData.exists) {
        return FeedModel.fromJson(postData.data);
      } else {
        return null;
      }
    } catch (error) {
      cprint("Could not get the post");
      throw error;
    }
  }
}
