import 'package:hellohuts_app/models/test.dart';

class PostDetail {
  String key;
  FeedModel feedModel;
  List<String> imagePathList;
  String longDescription;

  PostDetail(
      {this.key, this.feedModel, this.imagePathList, this.longDescription});

  PostDetail.fromJson(Map<String, dynamic> map) {
    key = map["post_key"];
    if (map["feed_model"] != null) {
      feedModel = FeedModel.fromJson(map["feed_model"]);
    }
    if (map["post_image_list"] != null) {
      imagePathList =
          map["post_image_list"].forEach((item) => imagePathList.add(item));
    }
    longDescription = map["post_full_description"];
  }

  toJson() {
    return null;
  }
}
