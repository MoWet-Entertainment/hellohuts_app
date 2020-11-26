// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectDetailsModel _$_$_ProjectDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _$_ProjectDetailsModel(
    projectArea: json['project_area'] as String,
    plinthArea: json['plinth_area'] as String,
    projectEstimate: json['project_estimate'] as String,
    projectTotalPaid: json['project_total_paid'] as String,
    projectStartDate: json['project_start_date'] as String,
    projectDateOfCompletion: json['project_date_of_completion'] as String,
    projectEstDateOfCompletion: json['projectEstDateOfCompletion'] as String,
    percentageOfCompletion: json['project_completion_perc'] as String,
  );
}

Map<String, dynamic> _$_$_ProjectDetailsModelToJson(
        _$_ProjectDetailsModel instance) =>
    <String, dynamic>{
      'project_area': instance.projectArea,
      'plinth_area': instance.plinthArea,
      'project_estimate': instance.projectEstimate,
      'project_total_paid': instance.projectTotalPaid,
      'project_start_date': instance.projectStartDate,
      'project_date_of_completion': instance.projectDateOfCompletion,
      'projectEstDateOfCompletion': instance.projectEstDateOfCompletion,
      'project_completion_perc': instance.percentageOfCompletion,
    };
