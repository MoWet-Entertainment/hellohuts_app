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
}

///for Defining different categories of the item used
enum CustomizeOptions {
  Budget,
  Balanced,
  Best,
  None,
  Basic,
  Standard,
  Classic,
}



class CostEstimation extends Equatable {
  final CustomizeOptions buildingMaterialsType;
  final CustomizeOptions flooringType;
  final CustomizeOptions electricalsType;
  final CustomizeOptions plumbingType;
  final CustomizeOptions doorsAndWindowsType;
  final CustomizeOptions kitchenDeorType;
  final CustomizeOptions interiorDecorType;
  final CustomizeOptions exteriorDecorType;

  CostEstimation({
    @required this.buildingMaterialsType,
    @required this.flooringType,
    @required this.electricalsType,
    @required this.plumbingType,
    @required this.doorsAndWindowsType,
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
    }  if (dataVal == JsonConstants.none) {
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


  String _getCustomizeOption(CustomizeOptions option) {

    if (option == CustomizeOptions.Budget) {
      return JsonConstants.budgetType;
    } else if (option == CustomizeOptions.Balanced) {
      return JsonConstants.balancedType;
    } else if (option == CustomizeOptions.Best) {
      return JsonConstants.bestType;
    } if (option == CustomizeOptions.Basic) {
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


  @override
  List<Object> get props => [
        this.buildingMaterialsType,
        this.flooringType,
        this.electricalsType,
        this.plumbingType,
        this.doorsAndWindowsType,
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
