import 'package:hellohuts_app/constants/json_constants.dart';

class LikeList {
  String key;
  String userId;
  LikeList({this.key, this.userId});
  LikeList.fromJson(Map<dynamic, dynamic> map, {String key}) {
    key = key;
    userId = map[AppFeedConstants.userId];
  }
  toJson() {
    return {AppFeedConstants.userId: userId};
  }

  @override
  String toString() {
    return 'LikeList{key: $key, userId: $userId}';
  }
}


