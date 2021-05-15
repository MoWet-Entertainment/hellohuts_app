import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/dashboard/reports/project_stages/project_stage_model.dart';
part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
abstract class ReportModel with _$ReportModel {
    @JsonSerializable(explicitToJson: true)
factory ReportModel({
    @JsonKey(name: JsonConstants.activeStages) List<ProjectStageModel> activeStages,
    @JsonKey(name: JsonConstants.completedStages) List<ProjectStageModel> completedStages,
    @JsonKey(name: JsonConstants.upcomingStages) List<ProjectStageModel>upcomingStages,
        @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC) DateTime updatedTimeStamp
  }) = _ReportModel;

   factory ReportModel.fromJson(Map<String, dynamic> json) =>
      _$ReportModelFromJson(json);

  factory ReportModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return ReportModel.fromJson(json);
  }
}
