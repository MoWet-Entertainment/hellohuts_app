import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';

part 'selected_plan.freezed.dart';
part 'selected_plan.g.dart';

@freezed
abstract class SelectedPlanModel with _$SelectedPlanModel {
  @JsonSerializable(explicitToJson: true)
  factory SelectedPlanModel({
    @JsonKey(name: JsonConstants.buildingMaterialsType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions buildingMaterialsType,
    @JsonKey(name: JsonConstants.flooringType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions flooringType,
    @JsonKey(name: JsonConstants.electricalsType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions electricalsType,
    @JsonKey(name: JsonConstants.plumbingType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions plumbingType,
    @JsonKey(name: JsonConstants.doorsAndWindowsType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions doorsAndWindowsType,
    @JsonKey(name: JsonConstants.kitchenDecorType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions kitchenDecorType,
    @JsonKey(name: JsonConstants.interiorDecorType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions interiorDecorType,
    @JsonKey(name: JsonConstants.exteriorDecorType, fromJson: SelectedPlanModel._setCustomizeOptions, toJson: SelectedPlanModel._getCustomizeOption)
        CustomizeOptions exteriorDecorType,
    @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime updatedTimeStamp,
  }) = _SelectedPlanModel;

  factory SelectedPlanModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedPlanModelFromJson(json);

  factory SelectedPlanModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return SelectedPlanModel.fromJson(json);
  }
  static CustomizeOptions _setCustomizeOptions(String dataVal) {
    if (dataVal == JsonConstants.bestType) {
      return CustomizeOptions.Best;
    } else if (dataVal == JsonConstants.balancedType) {
      return CustomizeOptions.Balanced;
    } else if (dataVal == JsonConstants.budgetType) {
      return CustomizeOptions.Budget;
    }
    if (dataVal == JsonConstants.none) {
      return CustomizeOptions.None;
    } else if (dataVal == JsonConstants.basic) {
      return CustomizeOptions.Basic;
    } else if (dataVal == JsonConstants.standard) {
      return CustomizeOptions.Standard;
    } else if (dataVal == JsonConstants.classic) {
      return CustomizeOptions.Classic;
    } else {
      return null;
    }
  }

  static String _getCustomizeOption(CustomizeOptions option) {
    if (option == CustomizeOptions.Budget) {
      return JsonConstants.budgetType;
    } else if (option == CustomizeOptions.Balanced) {
      return JsonConstants.balancedType;
    } else if (option == CustomizeOptions.Best) {
      return JsonConstants.bestType;
    }
    if (option == CustomizeOptions.Basic) {
      return JsonConstants.basic;
    } else if (option == CustomizeOptions.None) {
      return JsonConstants.none;
    } else if (option == CustomizeOptions.Standard) {
      return JsonConstants.standard;
    } else if (option == CustomizeOptions.Classic) {
      return JsonConstants.classic;
    } else {
      return null;
    }
  }
}

@freezed
abstract class OtherBuildingRequirementsModel
    with _$OtherBuildingRequirementsModel {
  @JsonSerializable(explicitToJson: true)
  factory OtherBuildingRequirementsModel({
    @JsonKey(name: JsonConstants.otherRoomTypes, toJson: OtherBuildingRequirementsModel._roomTypesToJson, fromJson: OtherBuildingRequirementsModel._roomTypesFromJson)
        List<RoomTypes> otherRequirementsList,
    @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime updatedTimeStamp,
  }) = _OtherBuildingRequirementsModel;

  static List<String> _roomTypesToJson(List<RoomTypes> list) {
    List<String> toJsonList = null;
    toJsonList = list.map((val) => describeEnum(val)).toList();
    return toJsonList;
  }

  factory OtherBuildingRequirementsModel.fromJson(Map<String, dynamic> json) =>
      _$OtherBuildingRequirementsModelFromJson(json);

  factory OtherBuildingRequirementsModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return OtherBuildingRequirementsModel.fromJson(json);
  }
  static List<RoomTypes> _roomTypesFromJson(List<String> list) {
    List<RoomTypes> roomTypeList = null;
    roomTypeList = list.map((val) {
      RoomTypes type =
          RoomTypes.values.firstWhere((ele) => describeEnum(ele) == val);
      return type;
    }).toList();
    return roomTypeList;
  }
}

@freezed
abstract class BuildingRequirementsModel with _$BuildingRequirementsModel {
  @JsonSerializable(explicitToJson: true)
  factory BuildingRequirementsModel({
    @JsonKey(name: JsonConstants.numberOfStoreys, fromJson: stringToInt, toJson: intToString)
        int noOfStoreys,
    @JsonKey(name: JsonConstants.numberOfBedrooms, fromJson: stringToInt, toJson: intToString)
        int noOfBedrooms,
    @JsonKey(name: JsonConstants.numberOfBathrooms, fromJson: stringToInt, toJson: intToString)
        int noOfBathrooms,
    @JsonKey(name: JsonConstants.otherBuildingRequirements)
        OtherBuildingRequirementsModel otherBuildingRequirements,
    @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime updatedTimeStamp,
  }) = _BuildingRequirementsModel;
  factory BuildingRequirementsModel.fromJson(Map<String, dynamic> json) =>
      _$BuildingRequirementsModelFromJson(json);

  factory BuildingRequirementsModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return BuildingRequirementsModel.fromJson(json);
  }
}

@freezed
abstract class MaterialItemModel with _$MaterialItemModel {
  @JsonSerializable(explicitToJson: true)
  factory MaterialItemModel({
    @JsonKey(name: JsonConstants.itemName) String itemName,
    @JsonKey(name: JsonConstants.itemText1) String itemText1,
    @JsonKey(name: JsonConstants.itemText2) String itemText2,
    @JsonKey(name: JsonConstants.itemImage) String itemImage,
  }) = _MaterialItemModel;

  factory MaterialItemModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemModelFromJson(json);

  factory MaterialItemModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return MaterialItemModel.fromJson(json);
  }
}

@freezed
abstract class MaterialGroupModel with _$MaterialGroupModel {
  @JsonSerializable(explicitToJson: true)
  factory MaterialGroupModel({
    @JsonKey(name: JsonConstants.itemMainGroup) String itemMainGroup,
    @JsonKey(name: JsonConstants.contents) List<MaterialItemModel> contents,
  }) = _MaterialGroupModel;

   factory MaterialGroupModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialGroupModelFromJson(json);

  factory MaterialGroupModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return MaterialGroupModel.fromJson(json);
  }
}

@freezed
abstract class MaterialSelectedModel with _$MaterialSelectedModel {
  @JsonSerializable(explicitToJson: true)
  factory MaterialSelectedModel({
    @JsonKey(name:JsonConstants.buildingMaterials) List<MaterialGroupModel> buildingMaterials,
    @JsonKey(name:JsonConstants.flooring) List<MaterialGroupModel> flooring,
    @JsonKey(name:JsonConstants.plumbing) List<MaterialGroupModel> plumbing,
    @JsonKey(name:JsonConstants.electricals) List<MaterialGroupModel> electricals,
    @JsonKey(name: JsonConstants.doorsAndWindows)List<MaterialGroupModel> doorsAndWindows,
    @JsonKey(name:JsonConstants.kitchenDecors) List<MaterialGroupModel> kitchenDecors,
    @JsonKey(name:JsonConstants.interiorDecor) List<MaterialGroupModel> interiorDecor,
    @JsonKey(name:JsonConstants.exteriorDecor)List<MaterialGroupModel> exteriorDecor,
    @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
      DateTime updatedTimeStamp
  }) = _MaterialSelectedModel;

 factory MaterialSelectedModel.fromJson(Map<String, dynamic> json) =>
      _$MaterialSelectedModelFromJson(json);

  factory MaterialSelectedModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return MaterialSelectedModel.fromJson(json);
  }
}
