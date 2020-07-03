import 'package:hellohuts_app/constants/mock2.dart';
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/app_state.dart';

class FeedState extends AppState {
  bool isBusy = false;

  bool _notificationFlag = false;

  List<FeedModel> _feedList = [];

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

  void setNotication(bool notificationFlag) {
    _notificationFlag = notificationFlag;
    notifyListeners();
  }

  bool get isNotificationFlag => _notificationFlag;
}
