import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
part 'project_details.freezed.dart';
part 'project_details.g.dart';

@freezed
abstract class ProjectDetailsModel with _$ProjectDetailsModel {
  @JsonSerializable(explicitToJson: true)
  factory ProjectDetailsModel({
    @JsonKey(name: JsonConstants.project_area) String projectArea,
    @JsonKey(name: JsonConstants.plinth_area) String plinthArea,
    @JsonKey(name: JsonConstants.projectEstimate) String projectEstimate,
    @JsonKey(name: JsonConstants.projectTotalPaid) String projectTotalPaid,
    @JsonKey(name: JsonConstants.projectStartDate) String projectStartDate,
    @JsonKey(name: JsonConstants.projectDateOfCompletion)
        String projectDateOfCompletion,
    String projectEstDateOfCompletion,
    @JsonKey(name: JsonConstants.projectCompletionPercentage)
        String percentageOfCompletion,
  }) = _ProjectDetailsModel;

   factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsModelFromJson(json);

  factory ProjectDetailsModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return ProjectDetailsModel.fromJson(json);
  }
  
}
