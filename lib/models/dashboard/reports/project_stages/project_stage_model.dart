import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/enums/enums.dart';
import 'package:hellohuts_app/helper/utilities.dart';
part 'project_stage_model.freezed.dart';
part 'project_stage_model.g.dart';

@freezed
abstract class ProjectStageModel with _$ProjectStageModel {
  @JsonSerializable(explicitToJson: true)
  factory ProjectStageModel({
    @JsonKey(name: JsonConstants.itemName) String itemName,
    @JsonKey(name:JsonConstants.itemImage) String itemImage,
    @JsonKey(name: JsonConstants.currentStage, fromJson: ProjectStageModel._setCurrentStage, toJson: ProjectStageModel._getCurrentStage)
        Stages currentStage,
        @JsonKey(name:JsonConstants.date ,fromJson: dateTimeFromUTC, toJson: dateTimeToUTC) DateTime date,
         @JsonKey(nullable: true, name:JsonConstants.estimatedDate,fromJson: dateTimeFromUTC, toJson: dateTimeToUTC) DateTime estimatedDate,
         @JsonKey(nullable:true, name: JsonConstants.actualDate,fromJson: dateTimeFromUTC, toJson: dateTimeToUTC) DateTime actualDate,
   }) = _ProjectStageModel;

  static Stages _setCurrentStage(String val) {
    if (val == JsonConstants.active) {
      return Stages.ACTIVE;
    } else if (val == JsonConstants.pending) {
      return Stages.PENDING;
    } else if (val == JsonConstants.refused) {
      return Stages.REFUSED;
    } else if (val == JsonConstants.rejected) {
      return Stages.REJECTED;
    } else if (val == JsonConstants.onHold) {
      return Stages.ON_HOLD;
    } else if (val == JsonConstants.completed) {
      return Stages.COMPLETED;
    } else {
      return Stages.UNDEFINED;
    }
  }

  static String _getCurrentStage(Stages stage) {
    if (stage == Stages.ACTIVE) {
      return JsonConstants.active;
    } else if (stage == Stages.COMPLETED) {
      return JsonConstants.completed;
    } else if (stage == Stages.PENDING) {
      return JsonConstants.pending;
    } else if (stage == Stages.REJECTED) {
      return JsonConstants.rejected;
    } else if (stage == Stages.ON_HOLD) {
      return JsonConstants.onHold;
    } else if (stage == Stages.REFUSED) {
      return JsonConstants.refused;
    } else
      return null;
  }

  
  factory ProjectStageModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectStageModelFromJson(json);

  factory ProjectStageModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return ProjectStageModel.fromJson(json);
  }
}
