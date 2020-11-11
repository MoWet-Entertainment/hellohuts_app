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
      AppFeedConstants.userId: userId,
      AppFeedConstants.postTitle: title,
      AppFeedConstants.postDescription: description,
      AppFeedConstants.postLikeCount: likeCount,
      AppFeedConstants.postCommentCount: commentCount ?? 0,
      AppFeedConstants.postShareCount: shareCount ?? 0,
      AppFeedConstants.postCreatedAt: createdAt,
      AppFeedConstants.postImagePathList: imagePathList,
      AppFeedConstants.postLikeList: likeMap,
      AppFeedConstants.postCommentsList: commentMap,
      AppFeedConstants.postTags: tags,
      AppFeedConstants.postCommentKeyList: commentKeyList,
      AppFeedConstants.postedUser: user == null ? null : user.toJson(),
      AppFeedConstants.postParentKey: parentKey,
      AppFeedConstants.postChildKey: childKey,
    };
  }

  dynamic getLikeList(List<String> list) {
    if (list != null && list.length > 0) {
      var result = Map.fromIterable(list,
          key: (v) => AppFeedConstants.userId, value: (v) => v[0]);
      return result;
    }
  }

  FeedModel.fromJson(Map<String, dynamic> map) {
    if (likeList == null) {
      likeList = [];
    }
    key = map[AppFeedConstants.key];
    title = map[AppFeedConstants.postTitle];
    description = map[AppFeedConstants.postDescription];
    userId = map[AppFeedConstants.userId];
    likeCount = map[AppFeedConstants.postLikeCount];
    commentCount = map[AppFeedConstants.postCommentCount];
    shareCount = map[AppFeedConstants.postShareCount];
    user = AppUser.fromJson(map[AppFeedConstants.postedUser]);
    createdAt = map[AppFeedConstants.postCreatedAt];
    parentKey = map[AppFeedConstants.postParentKey];
    childKey = map[AppFeedConstants.postChildKey];
    if (map[AppFeedConstants.postImagePathList] != null) {
      imagePathList = List<String>();
      map[AppFeedConstants.postImagePathList].forEach((val) {
        imagePathList.add(val);
      });
    }
    if (map[AppFeedConstants.postTags] != null) {
      tags = List<String>();
      map[AppFeedConstants.postTags].forEach((val) {
        tags.add(val);
      });
    }
    if (map[AppFeedConstants.postLikeList] != null) {
      map[AppFeedConstants.postLikeList].forEach((key, value) {
        if (value.containsKey(AppFeedConstants.userId)) {
          LikeList list =
              LikeList(key: key, userId: value[AppFeedConstants.userId]);
          likeList.add(list);
        }
      });
      likeCount = likeList.length;
    } else {
      likeList = [];
      likeCount = 0;
    }
    if (map[AppFeedConstants.postCommentKeyList] != null) {
      map[AppFeedConstants.postCommentKeyList].forEach((value) {
        commentKeyList = List<String>();
        map[AppFeedConstants.postCommentKeyList].forEach((value) {
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
