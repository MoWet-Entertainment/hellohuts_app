import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/models/address/address.dart';
import 'package:hellohuts_app/helper/utilities.dart';

import 'package:hellohuts_app/models/dashboard/contractor_model/contractor_model.dart';
import 'package:hellohuts_app/models/dashboard/engineer_model/engineer_model.dart';
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
        @JsonKey(name: JsonConstants.baseRate) String baseRate,
    @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)  String projectEstDateOfCompletion,
    @JsonKey(name: JsonConstants.projectCompletionPercentage)
        String percentageOfCompletion,

        @JsonKey(name: JsonConstants.projectEngineer) EngineerModel projectEngineer,
        @JsonKey(name: JsonConstants.contractor) ContractorModel contractor,
        @JsonKey(name:JsonConstants.projectAddress) Address projectAddress,
            @JsonKey(
        name: JsonConstants.createdAt,
        fromJson: dateTimeFromUTC,
        toJson:dateTimeToUTC)
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime updatedTimeStamp,
  }) = _ProjectDetailsModel;

   factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectDetailsModelFromJson(json);

  factory ProjectDetailsModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return ProjectDetailsModel.fromJson(json);
  }
  
}
