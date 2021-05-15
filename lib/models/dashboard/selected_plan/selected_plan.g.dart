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
    paintingMaterialsType: SelectedPlanModel._setCustomizeOptions(
        json['customization_painting_materials'] as String),
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
      'customization_painting_materials':
          SelectedPlanModel._getCustomizeOption(instance.paintingMaterialsType),
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

_$_MaterialItemModel _$_$_MaterialItemModelFromJson(Map<String, dynamic> json) {
  return _$_MaterialItemModel(
    itemName: json['item_name'] as String,
    itemText1: json['item_text1'] as String,
    itemText2: json['item_text2'] as String,
    itemImage: json['item_image'] as String,
  );
}

Map<String, dynamic> _$_$_MaterialItemModelToJson(
        _$_MaterialItemModel instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'item_text1': instance.itemText1,
      'item_text2': instance.itemText2,
      'item_image': instance.itemImage,
    };

_$_MaterialGroupModel _$_$_MaterialGroupModelFromJson(
    Map<String, dynamic> json) {
  return _$_MaterialGroupModel(
    itemMainGroup: json['item_main_group'] as String,
    contents: (json['contents'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_MaterialGroupModelToJson(
        _$_MaterialGroupModel instance) =>
    <String, dynamic>{
      'item_main_group': instance.itemMainGroup,
      'contents': instance.contents?.map((e) => e?.toJson())?.toList(),
    };

_$_MaterialSelectedModel _$_$_MaterialSelectedModelFromJson(
    Map<String, dynamic> json) {
  return _$_MaterialSelectedModel(
    buildingMaterials: (json['building_materials'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flooring: (json['flooring'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    plumbing: (json['plumbing'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    electricals: (json['electricals'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    doorsAndWindows: (json['doors_and_windows'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    kitchenDecors: (json['kitchen_decor'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    interiorDecor: (json['interior_decor'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    exteriorDecor: (json['exterior_decor'] as List)
        ?.map((e) => e == null
            ? null
            : MaterialGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$_$_MaterialSelectedModelToJson(
        _$_MaterialSelectedModel instance) =>
    <String, dynamic>{
      'building_materials':
          instance.buildingMaterials?.map((e) => e?.toJson())?.toList(),
      'flooring': instance.flooring?.map((e) => e?.toJson())?.toList(),
      'plumbing': instance.plumbing?.map((e) => e?.toJson())?.toList(),
      'electricals': instance.electricals?.map((e) => e?.toJson())?.toList(),
      'doors_and_windows':
          instance.doorsAndWindows?.map((e) => e?.toJson())?.toList(),
      'kitchen_decor':
          instance.kitchenDecors?.map((e) => e?.toJson())?.toList(),
      'interior_decor':
          instance.interiorDecor?.map((e) => e?.toJson())?.toList(),
      'exterior_decor':
          instance.exteriorDecor?.map((e) => e?.toJson())?.toList(),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };
