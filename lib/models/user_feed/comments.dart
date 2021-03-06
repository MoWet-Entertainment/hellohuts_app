import 'package:flutter/cupertino.dart';
import 'package:hellohuts_app/constants/json_constants.dart';

class CommentList {
  String key;
  String userId;
  String comment;
  CommentList({this.key, this.userId, this.comment});
  CommentList.fromJson(Map<dynamic, dynamic> map, {String key}) {
    key = key;
    userId = map[JsonConstants.userId];
    comment = map[JsonConstants.postCommentsList];
  }
  toJson() {
    return {
      JsonConstants.userId: userId,
      JsonConstants.postCommentsList: comment,
    };
  }
}

class Comment {
  String userName;
  String userPhotoUrl;
  String comment;
  String timeStamp;
  String userId;
  String key;
  String parentKey;
  List<String> childCommentKeyList;
  Comment({
    this.userName,
    this.userPhotoUrl,
    @required this.comment,
    @required this.timeStamp,
    @required this.userId,
    this.key,
    this.parentKey,
    this.childCommentKeyList,
  });

  Comment.fromJson(Map<String, dynamic> map, {String key}) {
    key = key;
    userName = JsonConstants.userName;
    userPhotoUrl = JsonConstants.userPhotoUrl;
  }

  @override
  String toString() {
    return 'Comment{userName: $userName, userPhotoUrl: $userPhotoUrl, comment: $comment, timeStamp: $timeStamp, userId: $userId, key: $key, parentKey: $parentKey}';
  }
}
