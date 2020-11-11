import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
abstract class Comment with _$Comment {
  @JsonSerializable(explicitToJson: true)
  factory Comment({
    @JsonKey(name: JsonConstants.userName)
    String userName,
    @JsonKey(name: JsonConstants.userPhotoUrl)
    String userPhotoUrl,
    @JsonKey(name: JsonConstants.comment)
    @required String comment,
    @JsonKey(name:JsonConstants.createdAt)
    @required String createdTimeStamp,

    @JsonKey(name:JsonConstants.updated_at)
    String updatedTimeStamp,

    @JsonKey(name: JsonConstants.userId)
    @required String userId,

    @JsonKey(name:JsonConstants.key)
    @required String key,

    @JsonKey(name: JsonConstants.parentKey)
    String parentKey,

    @JsonKey(name: JsonConstants.postId)
    @required String postId,

        @JsonKey(name: JsonConstants.isParent)
    @Default(false) bool isParent,

    @JsonKey(name: JsonConstants.childList)
    List childCommentList,
  }) = _Comment;
}
