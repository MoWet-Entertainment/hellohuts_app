// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportModel _$_$_ReportModelFromJson(Map<String, dynamic> json) {
  return _$_ReportModel(
    activeStages: (json['active_stages'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectStageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    completedStages: (json['completed_stages'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectStageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    upcomingStages: (json['upcoming_stages'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectStageModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$_$_ReportModelToJson(_$_ReportModel instance) =>
    <String, dynamic>{
      'active_stages': instance.activeStages?.map((e) => e?.toJson())?.toList(),
      'completed_stages':
          instance.completedStages?.map((e) => e?.toJson())?.toList(),
      'upcoming_stages':
          instance.upcomingStages?.map((e) => e?.toJson())?.toList(),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };
