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
    baseRate: json['base_rate'] as String,
    projectEstDateOfCompletion:
        json['project_est_date_of_completion'] as String,
    percentageOfCompletion: json['project_completion_perc'] as String,
    projectEngineer: json['project_engineer'] == null
        ? null
        : EngineerModel.fromJson(
            json['project_engineer'] as Map<String, dynamic>),
    contractor: json['contractor'] == null
        ? null
        : ContractorModel.fromJson(json['contractor'] as Map<String, dynamic>),
    projectAddress: json['project_address'] == null
        ? null
        : Address.fromJson(json['project_address'] as Map<String, dynamic>),
    selectedPlan: json['selected_plan'] == null
        ? null
        : SelectedPlanModel.fromJson(
            json['selected_plan'] as Map<String, dynamic>),
    buildingRequirements: json['building_requirements'] == null
        ? null
        : BuildingRequirementsModel.fromJson(
            json['building_requirements'] as Map<String, dynamic>),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
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
      'base_rate': instance.baseRate,
      'project_est_date_of_completion': instance.projectEstDateOfCompletion,
      'project_completion_perc': instance.percentageOfCompletion,
      'project_engineer': instance.projectEngineer?.toJson(),
      'contractor': instance.contractor?.toJson(),
      'project_address': instance.projectAddress?.toJson(),
      'selected_plan': instance.selectedPlan?.toJson(),
      'building_requirements': instance.buildingRequirements?.toJson(),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };
