// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_stage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectStageModel _$_$_ProjectStageModelFromJson(Map<String, dynamic> json) {
  return _$_ProjectStageModel(
    itemName: json['item_name'] as String,
    itemImage: json['item_image'] as String,
    currentStage:
        ProjectStageModel._setCurrentStage(json['current_stage'] as String),
    date: dateTimeFromUTC(json['date'] as String),
    estimatedDate: dateTimeFromUTC(json['estimated_date'] as String),
    actualDate: dateTimeFromUTC(json['actual_date'] as String),
  );
}

Map<String, dynamic> _$_$_ProjectStageModelToJson(
        _$_ProjectStageModel instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'item_image': instance.itemImage,
      'current_stage':
          ProjectStageModel._getCurrentStage(instance.currentStage),
      'date': dateTimeToUTC(instance.date),
      'estimated_date': dateTimeToUTC(instance.estimatedDate),
      'actual_date': dateTimeToUTC(instance.actualDate),
    };
