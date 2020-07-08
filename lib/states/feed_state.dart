import 'package:hellohuts_app/constants/mock2.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/models/user_feed/post_detail.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:meta/meta.dart';

class FeedState extends AppState {
  bool isBusy = false;

  bool _notificationFlag = false;

  List<FeedModel> _feedList = [];
  PostDetail _postDetail;

  void getDataFromDatabase() {
    // var link = "https://my.api.mockaroo.com/FeedSchema.json?key=ba8ce270";
    // var resp = await http.get(link);
    // final jsonVal = json.decode(resp.body);

    isBusy = true;
    final jsonVal = Mock2.list;

    for (var model in jsonVal) {
      var temp = FeedModel.fromJson(model);
      _feedList.add(temp);
    }
    notifyListeners();
    isBusy = false;
  }

  ///`feedList` contain [all the posts] fetched from the database
  List<FeedModel> get feedList {
    if (_feedList == null) {
      return null;
    } else {
      return List.from(_feedList);
    }
  }

  ///contain all posts for the explore page
  List<FeedModel> getFeedList() {
    return feedList;
  }

  PostDetail get postDetail => _postDetail;

  void setNotication(bool notificationFlag) {
    _notificationFlag = notificationFlag;
    notifyListeners();
  }

  bool get isNotificationFlag => _notificationFlag;

  ///Add/remove like on a post

  void addLikeToPost(FeedModel model, String userId) {
    //TODO:Add Like Aggregation method(Cloud functions) instead of this
    model.userLiked = !model.userLiked;
    notifyListeners();
  }

  ///[getPostDetailFromDatabase] is used to get the details of the post from Firestore
  void getPostDetailFromDatabase({@required FeedModel model}) async {
    //TODO: Add methods to get the post detail from Database here
  }
}
