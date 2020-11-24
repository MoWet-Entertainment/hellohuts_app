import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/dashboard/dashboard_item.dart';
import 'package:hellohuts_app/states/app_state.dart';

class DashboardState extends AppState {
  List<DashboardItem> _recentActivitList = [];

  Future<List<DashboardItem>> getRecentActivityList() async {
    if (_recentActivitList.length == 0 || _recentActivitList == null) {
      return initRecentActivity();
    }
    return _recentActivitList;
  }

  Future<List<DashboardItem>> initRecentActivity() async {
    List<DashboardItem> list = Mock.recentActivityList
        .map((ele) => DashboardItem.fromJson(ele))
        .toList();
    _recentActivitList = list;
    return Future.delayed(Duration(seconds: 2), () {
      return list;
    });
  }
}
