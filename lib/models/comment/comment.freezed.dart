// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

// ignore: unused_element
  _Comment call(
      {@JsonKey(name: JsonConstants.displayName)
          String displayName,
      @JsonKey(name: JsonConstants.userName)
          String userName,
      @JsonKey(name: JsonConstants.userPhotoUrl)
          String userPhotoUrl,
      @required
      @JsonKey(name: JsonConstants.comment)
          String comment,
      @required
      @JsonKey(name: JsonConstants.createdAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @required
      @JsonKey(name: JsonConstants.userId)
          String userId,
      @JsonKey(name: JsonConstants.key)
          String key,
      @JsonKey(name: JsonConstants.parentKey)
          String parentKey,
      @required
      @JsonKey(name: JsonConstants.postId)
          String postId,
      @nullable
      @JsonKey(name: JsonConstants.isParent)
          bool isParent = false,
      @JsonKey(name: JsonConstants.childList)
          List<Comment> childCommentList,
      @nullable
      @JsonKey(name: JsonConstants.postCommentCount)
          int commentCount}) {
    return _Comment(
      displayName: displayName,
      userName: userName,
      userPhotoUrl: userPhotoUrl,
      comment: comment,
      createdTimeStamp: createdTimeStamp,
      updatedTimeStamp: updatedTimeStamp,
      userId: userId,
      key: key,
      parentKey: parentKey,
      postId: postId,
      isParent: isParent,
      childCommentList: childCommentList,
      commentCount: commentCount,
    );
  }

// ignore: unused_element
  Comment fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  @JsonKey(name: JsonConstants.displayName)
  String get displayName;
  @JsonKey(name: JsonConstants.userName)
  String get userName;
  @JsonKey(name: JsonConstants.userPhotoUrl)
  String get userPhotoUrl;
  @JsonKey(name: JsonConstants.comment)
  String get comment;
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: Comment._dateTimeFromUTC,
      toJson: Comment._dateTimeToUTC)
  DateTime get createdTimeStamp;
  @JsonKey(
      name: JsonConstants.updatedAt,
      fromJson: Comment._dateTimeFromUTC,
      toJson: Comment._dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @JsonKey(name: JsonConstants.userId)
  String get userId;
  @JsonKey(name: JsonConstants.key)
  String get key;
  @JsonKey(name: JsonConstants.parentKey)
  String get parentKey;
  @JsonKey(name: JsonConstants.postId)
  String get postId;
  @nullable
  @JsonKey(name: JsonConstants.isParent)
  bool get isParent;
  @JsonKey(name: JsonConstants.childList)
  List<Comment> get childCommentList;
  @nullable
  @JsonKey(name: JsonConstants.postCommentCount)
  int get commentCount;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.displayName)
          String displayName,
      @JsonKey(name: JsonConstants.userName)
          String userName,
      @JsonKey(name: JsonConstants.userPhotoUrl)
          String userPhotoUrl,
      @JsonKey(name: JsonConstants.comment)
          String comment,
      @JsonKey(name: JsonConstants.createdAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.userId)
          String userId,
      @JsonKey(name: JsonConstants.key)
          String key,
      @JsonKey(name: JsonConstants.parentKey)
          String parentKey,
      @JsonKey(name: JsonConstants.postId)
          String postId,
      @nullable
      @JsonKey(name: JsonConstants.isParent)
          bool isParent,
      @JsonKey(name: JsonConstants.childList)
          List<Comment> childCommentList,
      @nullable
      @JsonKey(name: JsonConstants.postCommentCount)
          int commentCount});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object displayName = freezed,
    Object userName = freezed,
    Object userPhotoUrl = freezed,
    Object comment = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
    Object userId = freezed,
    Object key = freezed,
    Object parentKey = freezed,
    Object postId = freezed,
    Object isParent = freezed,
    Object childCommentList = freezed,
    Object commentCount = freezed,
  }) {
    return _then(_value.copyWith(
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      userName: userName == freezed ? _value.userName : userName as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl as String,
      comment: comment == freezed ? _value.comment : comment as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
      userId: userId == freezed ? _value.userId : userId as String,
      key: key == freezed ? _value.key : key as String,
      parentKey: parentKey == freezed ? _value.parentKey : parentKey as String,
      postId: postId == freezed ? _value.postId : postId as String,
      isParent: isParent == freezed ? _value.isParent : isParent as bool,
      childCommentList: childCommentList == freezed
          ? _value.childCommentList
          : childCommentList as List<Comment>,
      commentCount:
          commentCount == freezed ? _value.commentCount : commentCount as int,
    ));
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.displayName)
          String displayName,
      @JsonKey(name: JsonConstants.userName)
          String userName,
      @JsonKey(name: JsonConstants.userPhotoUrl)
          String userPhotoUrl,
      @JsonKey(name: JsonConstants.comment)
          String comment,
      @JsonKey(name: JsonConstants.createdAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.userId)
          String userId,
      @JsonKey(name: JsonConstants.key)
          String key,
      @JsonKey(name: JsonConstants.parentKey)
          String parentKey,
      @JsonKey(name: JsonConstants.postId)
          String postId,
      @nullable
      @JsonKey(name: JsonConstants.isParent)
          bool isParent,
      @JsonKey(name: JsonConstants.childList)
          List<Comment> childCommentList,
      @nullable
      @JsonKey(name: JsonConstants.postCommentCount)
          int commentCount});
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object displayName = freezed,
    Object userName = freezed,
    Object userPhotoUrl = freezed,
    Object comment = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
    Object userId = freezed,
    Object key = freezed,
    Object parentKey = freezed,
    Object postId = freezed,
    Object isParent = freezed,
    Object childCommentList = freezed,
    Object commentCount = freezed,
  }) {
    return _then(_Comment(
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      userName: userName == freezed ? _value.userName : userName as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl as String,
      comment: comment == freezed ? _value.comment : comment as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
      userId: userId == freezed ? _value.userId : userId as String,
      key: key == freezed ? _value.key : key as String,
      parentKey: parentKey == freezed ? _value.parentKey : parentKey as String,
      postId: postId == freezed ? _value.postId : postId as String,
      isParent: isParent == freezed ? _value.isParent : isParent as bool,
      childCommentList: childCommentList == freezed
          ? _value.childCommentList
          : childCommentList as List<Comment>,
      commentCount:
          commentCount == freezed ? _value.commentCount : commentCount as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Comment with DiagnosticableTreeMixin implements _Comment {
  _$_Comment(
      {@JsonKey(name: JsonConstants.displayName)
          this.displayName,
      @JsonKey(name: JsonConstants.userName)
          this.userName,
      @JsonKey(name: JsonConstants.userPhotoUrl)
          this.userPhotoUrl,
      @required
      @JsonKey(name: JsonConstants.comment)
          this.comment,
      @required
      @JsonKey(name: JsonConstants.createdAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          this.createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          this.updatedTimeStamp,
      @required
      @JsonKey(name: JsonConstants.userId)
          this.userId,
      @JsonKey(name: JsonConstants.key)
          this.key,
      @JsonKey(name: JsonConstants.parentKey)
          this.parentKey,
      @required
      @JsonKey(name: JsonConstants.postId)
          this.postId,
      @nullable
      @JsonKey(name: JsonConstants.isParent)
          this.isParent = false,
      @JsonKey(name: JsonConstants.childList)
          this.childCommentList,
      @nullable
      @JsonKey(name: JsonConstants.postCommentCount)
          this.commentCount})
      : assert(comment != null),
        assert(createdTimeStamp != null),
        assert(userId != null),
        assert(postId != null);

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @override
  @JsonKey(name: JsonConstants.displayName)
  final String displayName;
  @override
  @JsonKey(name: JsonConstants.userName)
  final String userName;
  @override
  @JsonKey(name: JsonConstants.userPhotoUrl)
  final String userPhotoUrl;
  @override
  @JsonKey(name: JsonConstants.comment)
  final String comment;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: Comment._dateTimeFromUTC,
      toJson: Comment._dateTimeToUTC)
  final DateTime createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updatedAt,
      fromJson: Comment._dateTimeFromUTC,
      toJson: Comment._dateTimeToUTC)
  final DateTime updatedTimeStamp;
  @override
  @JsonKey(name: JsonConstants.userId)
  final String userId;
  @override
  @JsonKey(name: JsonConstants.key)
  final String key;
  @override
  @JsonKey(name: JsonConstants.parentKey)
  final String parentKey;
  @override
  @JsonKey(name: JsonConstants.postId)
  final String postId;
  @override
  @nullable
  @JsonKey(name: JsonConstants.isParent)
  final bool isParent;
  @override
  @JsonKey(name: JsonConstants.childList)
  final List<Comment> childCommentList;
  @override
  @nullable
  @JsonKey(name: JsonConstants.postCommentCount)
  final int commentCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(displayName: $displayName, userName: $userName, userPhotoUrl: $userPhotoUrl, comment: $comment, createdTimeStamp: $createdTimeStamp, updatedTimeStamp: $updatedTimeStamp, userId: $userId, key: $key, parentKey: $parentKey, postId: $postId, isParent: $isParent, childCommentList: $childCommentList, commentCount: $commentCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userPhotoUrl', userPhotoUrl))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('createdTimeStamp', createdTimeStamp))
      ..add(DiagnosticsProperty('updatedTimeStamp', updatedTimeStamp))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('parentKey', parentKey))
      ..add(DiagnosticsProperty('postId', postId))
      ..add(DiagnosticsProperty('isParent', isParent))
      ..add(DiagnosticsProperty('childCommentList', childCommentList))
      ..add(DiagnosticsProperty('commentCount', commentCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.userPhotoUrl, userPhotoUrl)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.createdTimeStamp, createdTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.createdTimeStamp, createdTimeStamp)) &&
            (identical(other.updatedTimeStamp, updatedTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTimeStamp, updatedTimeStamp)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.parentKey, parentKey) ||
                const DeepCollectionEquality()
                    .equals(other.parentKey, parentKey)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.isParent, isParent) ||
                const DeepCollectionEquality()
                    .equals(other.isParent, isParent)) &&
            (identical(other.childCommentList, childCommentList) ||
                const DeepCollectionEquality()
                    .equals(other.childCommentList, childCommentList)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(userPhotoUrl) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(createdTimeStamp) ^
      const DeepCollectionEquality().hash(updatedTimeStamp) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(parentKey) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(isParent) ^
      const DeepCollectionEquality().hash(childCommentList) ^
      const DeepCollectionEquality().hash(commentCount);

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  factory _Comment(
      {@JsonKey(name: JsonConstants.displayName)
          String displayName,
      @JsonKey(name: JsonConstants.userName)
          String userName,
      @JsonKey(name: JsonConstants.userPhotoUrl)
          String userPhotoUrl,
      @required
      @JsonKey(name: JsonConstants.comment)
          String comment,
      @required
      @JsonKey(name: JsonConstants.createdAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: Comment._dateTimeFromUTC, toJson: Comment._dateTimeToUTC)
          DateTime updatedTimeStamp,
      @required
      @JsonKey(name: JsonConstants.userId)
          String userId,
      @JsonKey(name: JsonConstants.key)
          String key,
      @JsonKey(name: JsonConstants.parentKey)
          String parentKey,
      @required
      @JsonKey(name: JsonConstants.postId)
          String postId,
      @nullable
      @JsonKey(name: JsonConstants.isParent)
          bool isParent,
      @JsonKey(name: JsonConstants.childList)
          List<Comment> childCommentList,
      @nullable
      @JsonKey(name: JsonConstants.postCommentCount)
          int commentCount}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  @JsonKey(name: JsonConstants.displayName)
  String get displayName;
  @override
  @JsonKey(name: JsonConstants.userName)
  String get userName;
  @override
  @JsonKey(name: JsonConstants.userPhotoUrl)
  String get userPhotoUrl;
  @override
  @JsonKey(name: JsonConstants.comment)
  String get comment;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: Comment._dateTimeFromUTC,
      toJson: Comment._dateTimeToUTC)
  DateTime get createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updatedAt,
      fromJson: Comment._dateTimeFromUTC,
      toJson: Comment._dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @override
  @JsonKey(name: JsonConstants.userId)
  String get userId;
  @override
  @JsonKey(name: JsonConstants.key)
  String get key;
  @override
  @JsonKey(name: JsonConstants.parentKey)
  String get parentKey;
  @override
  @JsonKey(name: JsonConstants.postId)
  String get postId;
  @override
  @nullable
  @JsonKey(name: JsonConstants.isParent)
  bool get isParent;
  @override
  @JsonKey(name: JsonConstants.childList)
  List<Comment> get childCommentList;
  @override
  @nullable
  @JsonKey(name: JsonConstants.postCommentCount)
  int get commentCount;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith;
}
