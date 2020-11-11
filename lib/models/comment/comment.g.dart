// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    userName: json['user_name'] as String,
    userPhotoUrl: json['user_photo_url'] as String,
    comment: json['comment'] as String,
    createdTimeStamp: json['created_at'] as String,
    updatedTimeStamp: json['updated_at'] as String,
    userId: json['uid'] as String,
    key: json['key'] as String,
    parentKey: json['parent_key'] as String,
    postId: json['post_id'] as String,
    isParent: json['is_parent'] as bool,
    childCommentList: json['child_list'] as List,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'user_photo_url': instance.userPhotoUrl,
      'comment': instance.comment,
      'created_at': instance.createdTimeStamp,
      'updated_at': instance.updatedTimeStamp,
      'uid': instance.userId,
      'key': instance.key,
      'parent_key': instance.parentKey,
      'post_id': instance.postId,
      'is_parent': instance.isParent,
      'child_list': instance.childCommentList,
    };
