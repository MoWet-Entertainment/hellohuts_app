import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/dashboard/dashboard_item/dashboard_item.dart';
import 'package:hellohuts_app/models/dashboard/project_details/project_details.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  ProjectDetailsModel get projectDetailsModel => _projectDetailsModel;
  Future<ProjectDetailsModel> get getProjectDetailsModel async {
    if (_projectDetailsModel == null) {
      return initProjectDetailModel();
    }
    return _projectDetailsModel;
  }

  Future<ProjectDetailsModel> initProjectDetailModel() async {
    ProjectDetailsModel model =
        ProjectDetailsModel.fromJson(Mock.projectDetails);
    return Future.delayed(Duration(seconds: 3), () {
      _projectDetailsModel = model;
      return model;
    });
  }
}

final dashbordState = Provider((ref) => DashboardState());
final projectDetailsProvider = FutureProvider<ProjectDetailsModel>((ref) async {
  final model = ref.read(dashbordState);
  print(model.getProjectDetailsModel.toString());
  return model.getProjectDetailsModel;
});

final recentActivityProvider = FutureProvider<List<DashboardItem>>((ref) async {
  final state = ref.read(dashbordState);
  return state.getRecentActivityList();
});



