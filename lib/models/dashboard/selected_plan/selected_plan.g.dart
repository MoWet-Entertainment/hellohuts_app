// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SelectedPlanModel _$_$_SelectedPlanModelFromJson(Map<String, dynamic> json) {
  return _$_SelectedPlanModel(
    buildingMaterialsType: SelectedPlanModel._setCustomizeOptions(
        json['customization_building_materials'] as String),
    flooringType: SelectedPlanModel._setCustomizeOptions(
        json['customization_flooring'] as String),
    electricalsType: SelectedPlanModel._setCustomizeOptions(
        json['customization_electricals'] as String),
    plumbingType: SelectedPlanModel._setCustomizeOptions(
        json['customization_plumbing'] as String),
    doorsAndWindowsType: SelectedPlanModel._setCustomizeOptions(
        json['customization_doors_and_windows'] as String),
    kitchenDecorType: SelectedPlanModel._setCustomizeOptions(
        json['customization_kitchen_decor'] as String),
    interiorDecorType: SelectedPlanModel._setCustomizeOptions(
        json['customization_interior_decor'] as String),
    exteriorDecorType: SelectedPlanModel._setCustomizeOptions(
        json['customization_exterior_decor'] as String),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$_$_SelectedPlanModelToJson(
        _$_SelectedPlanModel instance) =>
    <String, dynamic>{
      'customization_building_materials':
          SelectedPlanModel._getCustomizeOption(instance.buildingMaterialsType),
      'customization_flooring':
          SelectedPlanModel._getCustomizeOption(instance.flooringType),
      'customization_electricals':
          SelectedPlanModel._getCustomizeOption(instance.electricalsType),
      'customization_plumbing':
          SelectedPlanModel._getCustomizeOption(instance.plumbingType),
      'customization_doors_and_windows':
          SelectedPlanModel._getCustomizeOption(instance.doorsAndWindowsType),
      'customization_kitchen_decor':
          SelectedPlanModel._getCustomizeOption(instance.kitchenDecorType),
      'customization_interior_decor':
          SelectedPlanModel._getCustomizeOption(instance.interiorDecorType),
      'customization_exterior_decor':
          SelectedPlanModel._getCustomizeOption(instance.exteriorDecorType),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };

_$_OtherBuildingRequirementsModel _$_$_OtherBuildingRequirementsModelFromJson(
    Map<String, dynamic> json) {
  return _$_OtherBuildingRequirementsModel(
    otherRequirementsList: OtherBuildingRequirementsModel._roomTypesFromJson(
        json['other_room_types'] as List<String>),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$_$_OtherBuildingRequirementsModelToJson(
        _$_OtherBuildingRequirementsModel instance) =>
    <String, dynamic>{
      'other_room_types': OtherBuildingRequirementsModel._roomTypesToJson(
          instance.otherRequirementsList),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };

_$_BuildingRequirementsModel _$_$_BuildingRequirementsModelFromJson(
    Map<String, dynamic> json) {
  return _$_BuildingRequirementsModel(
    noOfStoreys: stringToInt(json['number_of_storeys'] as String),
    noOfBedrooms: stringToInt(json['number_of_bedrooms'] as String),
    noOfBathrooms: stringToInt(json['number_of_bathrooms'] as String),
    otherBuildingRequirements: json['other_building_requirements'] == null
        ? null
        : OtherBuildingRequirementsModel.fromJson(
            json['other_building_requirements'] as Map<String, dynamic>),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$_$_BuildingRequirementsModelToJson(
        _$_BuildingRequirementsModel instance) =>
    <String, dynamic>{
      'number_of_storeys': intToString(instance.noOfStoreys),
      'number_of_bedrooms': intToString(instance.noOfBedrooms),
      'number_of_bathrooms': intToString(instance.noOfBathrooms),
      'other_building_requirements':
          instance.otherBuildingRequirements?.toJson(),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };
