import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';

///different room categories available
enum RoomTypes {
  Bedroom,
  Bathroom,
  Livingroom,
  Kitchen,
  Sitout,
  Diningroom,
  Storeroom,
  LivingCumDining,
  StudyRoom,
  DressingArea,
  OpenKitchen,
  Balcony,
  UtilityRoom,
  PrayerRoom,
  UpperLivingRoom,
  Bar,
  Office,
  GameRoom,
  Porch
}

final Map<RoomTypes, String> customRequirementsSelection = {
  RoomTypes.Diningroom: "Dining Room",
  RoomTypes.Livingroom: "Living Room",
  RoomTypes.Office: "Office",
  RoomTypes.LivingCumDining: "Living + Dining",
  RoomTypes.Kitchen: "Kitchen",
  RoomTypes.OpenKitchen: "Open Kitchen",
  RoomTypes.Balcony: "Balcony",
  RoomTypes.DressingArea: "Dressing area",
  RoomTypes.Storeroom: "Store Room",
  RoomTypes.PrayerRoom: "Prayer Room",
  RoomTypes.StudyRoom: "Study Room",
  RoomTypes.UpperLivingRoom: "Upper Living Room",
  RoomTypes.GameRoom: "Game Room",
  RoomTypes.Bar: "Bar"
};

final Map<RoomTypes, String> requirementsBasePack1 = {
  RoomTypes.Kitchen: "Kitchen",
  RoomTypes.Livingroom: "Living Room",
  RoomTypes.Diningroom: "Dining Room",
  RoomTypes.Porch: "Porch",
  RoomTypes.Sitout: "Sitout",
  RoomTypes.Storeroom: "Store Room",
};

final Map<RoomTypes, String> requirementsBasePack2 = {
  RoomTypes.Kitchen: "Kitchen",
  RoomTypes.LivingCumDining: "Living + Dining Room",
  RoomTypes.Porch: "Porch",
  RoomTypes.Sitout: "Sitout",
  RoomTypes.Balcony: "Balcony",
};

///for Defining different categories of the item used
enum CustomizeOptions {
  Budget,
  Balanced,
  Best,
  None,
  Basic,
  Standard,
  Classic,
  Premium
}

class CostEstimation extends Equatable {
  final CustomizeOptions buildingMaterialsType;
  final CustomizeOptions flooringType;
  final CustomizeOptions electricalsType;
  final CustomizeOptions plumbingType;
  final CustomizeOptions doorsAndWindowsType;
  final CustomizeOptions paintingMaterialsType;
  final CustomizeOptions kitchenDeorType;
  final CustomizeOptions interiorDecorType;
  final CustomizeOptions exteriorDecorType;

  CostEstimation({
    @required this.buildingMaterialsType,
    @required this.flooringType,
    @required this.electricalsType,
    @required this.plumbingType,
    @required this.doorsAndWindowsType,
    @required this.paintingMaterialsType,
    @required this.kitchenDeorType,
    @required this.interiorDecorType,
    @required this.exteriorDecorType,
  });

  Map<String, dynamic> toJson() {
    return {
      JsonConstants.buildingMaterialsType: this.buildingMaterialsType ?? null,
      JsonConstants.flooringType: this.flooringType ?? null,
      JsonConstants.electricalsType: this.electricalsType ?? null,
      JsonConstants.plumbingType: this.plumbingType ?? null,
      JsonConstants.doorsAndWindowsType: this.doorsAndWindowsType ?? null,
      JsonConstants.paintingMaterialsType: this.paintingMaterialsType ?? null,
      JsonConstants.interiorDecorType: this.interiorDecorType ?? null,
      JsonConstants.exteriorDecorType: this.exteriorDecorType ?? null,
      JsonConstants.kitchenDecorType: this.kitchenDeorType ?? null,
    };
  }

  CostEstimation.fromData(Map<String, dynamic> data)
      : buildingMaterialsType =
            _setCustomizeOptions(data[JsonConstants.buildingMaterialsType]),
        flooringType = _setCustomizeOptions(data[JsonConstants.flooringType]),
        electricalsType =
            _setCustomizeOptions(data[JsonConstants.electricalsType]),
        plumbingType = _setCustomizeOptions(data[JsonConstants.plumbingType]),
        doorsAndWindowsType =
            _setCustomizeOptions(data[JsonConstants.doorsAndWindowsType]),
        paintingMaterialsType =
            _setCustomizeOptions(data[JsonConstants.paintingMaterialsType]),
        kitchenDeorType =
            _setCustomizeOptions(data[JsonConstants.kitchenDecorType]),
        interiorDecorType =
            _setCustomizeOptions(data[JsonConstants.interiorDecorType]),
        exteriorDecorType =
            _setCustomizeOptions(data[JsonConstants.exteriorDecorType]);

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
    } else if (dataVal == JsonConstants.premium) {
    } else {
      return null;
    }
  }

  String _getCustomizeOption(CustomizeOptions option) {
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
    } else if (option == CustomizeOptions.Premium) {
      return JsonConstants.premium;
    } else {
      return null;
    }
  }

  @override
  List<Object> get props => [
        this.buildingMaterialsType,
        this.flooringType,
        this.electricalsType,
        this.plumbingType,
        this.doorsAndWindowsType,
        this.paintingMaterialsType,
        this.kitchenDeorType,
        this.interiorDecorType,
        this.exteriorDecorType
      ];

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
