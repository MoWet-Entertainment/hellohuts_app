import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/dashboard/dashboard_item/dashboard_item.dart';
import 'package:hellohuts_app/models/dashboard/project_details/project_details.dart';
import 'package:hellohuts_app/states/app_state.dart';

class DashboardState extends AppState {
  List<DashboardItem> _recentActivitList = [];

  ProjectDetailsModel _projectDetailsModel;
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

  ProjectDetailsModel get getProjectDetailsModel {
    if (_projectDetailsModel == null) {
      initProjectDetailModel();
    }
    return _projectDetailsModel;
  }

  Future<ProjectDetailsModel> initProjectDetailModel() {
    ProjectDetailsModel model =
        ProjectDetailsModel.fromJson(Mock.projectDetails);
    print(model);
    return Future.delayed(Duration(seconds: 1), () {
      _projectDetailsModel = model;
      notifyListeners();
      return model;
    });
  }
}
