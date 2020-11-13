import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/models/user_feed/app_user.dart';
import 'package:hellohuts_app/models/user_feed/comments.dart';
import 'package:hellohuts_app/models/user_feed/likes.dart';

class FeedModel {
  String key;
  String parentKey;
  String childKey;
  String title;
  String description;
  String userId;
  int likeCount;
  List<LikeList> likeList;
  int commentCount;
  int activePage = 1;
  List<CommentList> commentList;
  int shareCount;
  String createdAt;
  List<String> imagePathList;
  List<String> tags;
  List<String> commentKeyList;
  AppUser user;

  FeedModel({
    this.key,
    this.title,
    this.description,
    this.userId,
    this.likeCount,
    this.commentList,
    this.commentCount,
    this.shareCount,
    this.createdAt,
    this.imagePathList,
    this.likeList,
    this.activePage,
    this.tags,
    this.user,
    this.commentKeyList,
    this.parentKey,
    this.childKey,
  });

  toJson() {
    Map<String, dynamic> likeMap;
    Map<String, dynamic> commentMap;
    if (likeList != null && likeList.length > 0) {
      likeMap = Map.fromIterable(likeList,
          key: (v) => v.key,
          value: (v) {
            var list = LikeList(key: v.key, userId: v.userId);
            return list.toJson();
          });
    }
    if (commentList != null && commentList.length > 0) {
      commentMap = Map.fromIterable(commentList,
          key: (v) => v.key,
          value: (v) {
            var list =
                CommentList(key: v.key, userId: v.userId, comment: v.comment);
            return list.toJson();
          });
    }
    return {
      JsonConstants.userId: userId,
      JsonConstants.postTitle: title,
      JsonConstants.postDescription: description,
      JsonConstants.postLikeCount: likeCount,
      JsonConstants.postCommentCount: commentCount ?? 0,
      JsonConstants.postShareCount: shareCount ?? 0,
      JsonConstants.createdAt: createdAt,
      JsonConstants.postImagePathList: imagePathList,
      JsonConstants.postLikeList: likeMap,
      JsonConstants.postCommentsList: commentMap,
      JsonConstants.postTags: tags,
      JsonConstants.postCommentKeyList: commentKeyList,
      JsonConstants.postedUser: user == null ? null : user.toJson(),
      JsonConstants.parentKey: parentKey,
      JsonConstants.childKey: childKey,
    };
  }

  dynamic getLikeList(List<String> list) {
    if (list != null && list.length > 0) {
      var result = Map.fromIterable(list,
          key: (v) => JsonConstants.userId, value: (v) => v[0]);
      return result;
    }
  }

  FeedModel.fromJson(Map<String, dynamic> map) {
    if (likeList == null) {
      likeList = [];
    }
    key = map[JsonConstants.key];
    title = map[JsonConstants.postTitle];
    description = map[JsonConstants.postDescription];
    userId = map[JsonConstants.userId];
    likeCount = map[JsonConstants.postLikeCount];
    commentCount = map[JsonConstants.postCommentCount];
    shareCount = map[JsonConstants.postShareCount];
    user = AppUser.fromJson(map[JsonConstants.postedUser]);
    createdAt = map[JsonConstants.createdAt];
    parentKey = map[JsonConstants.parentKey];
    childKey = map[JsonConstants.childKey];
    if (map[JsonConstants.postImagePathList] != null) {
      imagePathList = List<String>();
      map[JsonConstants.postImagePathList].forEach((val) {
        imagePathList.add(val);
      });
    }
    if (map[JsonConstants.postTags] != null) {
      tags = List<String>();
      map[JsonConstants.postTags].forEach((val) {
        tags.add(val);
      });
    }
    if (map[JsonConstants.postLikeList] != null) {
      map[JsonConstants.postLikeList].forEach((key, value) {
        if (value.containsKey(JsonConstants.userId)) {
          LikeList list =
              LikeList(key: key, userId: value[JsonConstants.userId]);
          likeList.add(list);
        }
      });
      likeCount = likeList.length;
    } else {
      likeList = [];
      likeCount = 0;
    }
    if (map[JsonConstants.postCommentKeyList] != null) {
      map[JsonConstants.postCommentKeyList].forEach((value) {
        commentKeyList = List<String>();
        map[JsonConstants.postCommentKeyList].forEach((value) {
          commentKeyList.add(value);
        });
      });
      commentCount = commentKeyList.length;
    } else {
      commentKeyList = [];
      commentCount = 0;
    }
  }

  bool get isValidPost {
    bool isValid = false;
    if (title != null &&
        title.isNotEmpty &&
        description != null &&
        description.isNotEmpty &&
        this.user != null &&
        this.user.uid != null) {
      isValid = true;
    } else {
      print("Invalid Post found. Id:- $key");
    }
    return isValid;
  }

  @override
  String toString() {
    return 'FeedModel{key: $key, parentKey: $parentKey, childKey: $childKey, title: $title, description: $description, userId: $userId, likeCount: $likeCount, likeList: $likeList, commentCount: $commentCount, commentList: $commentList, shareCount: $shareCount, createdAt: $createdAt, imagePathList: $imagePathList, tags: $tags, commentKeyList: $commentKeyList, user: $user}';
  }
}
