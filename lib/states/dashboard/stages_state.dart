import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/dashboard/reports/project_stages/project_stage_model.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StagesState extends AppState {
  List<ProjectStageModel> _projectStatges;

  Future<List<ProjectStageModel>> get projectStages async {
    if (_projectStatges == null) {
      return initProjectStages();
    }
    return _projectStatges;
  }

  Future<List<ProjectStageModel>> initProjectStages() async {
    List<ProjectStageModel> projectStages =
        Mock.projectStages.map((e) => ProjectStageModel.fromJson(e)).toList();
    _projectStatges = projectStages;
    print(projectStages.toString());
    return Future.delayed(Duration(seconds: 3), () {
      return projectStages;
    });
  }
}

final projectStagesState = Provider((ref) => StagesState());
final projectStagesProvider =
    FutureProvider<List<ProjectStageModel>>((ref) async {
  final model = ref.read(projectStagesState);
  return model.projectStages;
});
