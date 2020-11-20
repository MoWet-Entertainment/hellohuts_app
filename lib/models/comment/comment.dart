import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
abstract class Comment with _$Comment {
  @JsonSerializable(explicitToJson: true)
  factory Comment({
    @JsonKey(name: JsonConstants.displayName) String displayName,
    @JsonKey(name:JsonConstants.userName) String userName,
    @JsonKey(name: JsonConstants.userPhotoUrl) String userPhotoUrl,
    @JsonKey(name: JsonConstants.comment) @required String comment,
    @JsonKey(
        name: JsonConstants.createdAt,
        fromJson: Comment._dateTimeFromUTC,
        toJson: Comment._dateTimeToUTC)
    @required
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
        DateTime updatedTimeStamp,
    @JsonKey(name: JsonConstants.userId) @required String userId,
    @JsonKey(name: JsonConstants.key)  String key,
    @JsonKey(name: JsonConstants.parentKey) String parentKey,
    @JsonKey(name: JsonConstants.postId) @required String postId,
  @nullable  @JsonKey(name: JsonConstants.isParent) @Default(false) bool isParent,
    @JsonKey(name: JsonConstants.childList) List<Comment> childCommentList,
   @nullable @JsonKey(name:JsonConstants.postCommentCount)
    int commentCount,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return Comment.fromJson(json);
  }
  static DateTime _dateTimeFromUTC(String timeStamp) =>
      timeStamp == null ? null : DateTime.parse(timeStamp).toLocal();

  static String _dateTimeToUTC(DateTime timestamp) {
    var dt = timestamp.toUtc();
    var dateFormatted = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dt);
    return dateFormatted;
  }

}
