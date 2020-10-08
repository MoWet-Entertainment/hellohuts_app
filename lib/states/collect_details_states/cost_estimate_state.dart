import 'package:flutter/cupertino.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/states/app_state.dart';

class CostEstimateState extends ChangeNotifier {
  bool _needReset = false;

  set setReset(bool value) {
    _needReset = value;
    notifyListeners();
  }

  get needReset => _needReset;

  ///Number of Storeys  section
  int _selectedNumberOfStoreys = 2;
  get selectedNumberOfStoryes => _selectedNumberOfStoreys;
  set setNumberOfStoreys(int noOfStoreys) {
    _selectedNumberOfStoreys = noOfStoreys;
    notifyListeners();
  }

  ///Number of Bedrooms
  int _selectedNumberOfBedrooms = 4;
  get selectedNumberOfBedrooms => _selectedNumberOfBedrooms;
  set setNumberOfBedrooms(int noOfBedrooms) {
    _selectedNumberOfBedrooms = noOfBedrooms;
    notifyListeners();
  }

  ///Number of Bathrooms
  int _selectedNumberOfBathrooms = 3;
  get selectedNumberOfBathrooms => _selectedNumberOfBathrooms;
  set setNumberOfBathrooms(int noOfBathrooms) {
    _selectedNumberOfBathrooms = noOfBathrooms;
    notifyListeners();
  }

  ///Other Details
  int _selectedPack = 1;
  get selectedPack => _selectedPack;
  set setSelectedPack(int number) {
    _selectedPack = number;
    notifyListeners();
  }

  ///Custom Other details
  bool _isCustomOtherDetails = false;
  get isCustomOtherDetails => _isCustomOtherDetails;
  set setIsCustomOtherDetails(bool value) {
    _isCustomOtherDetails = value;
    notifyListeners();
  }

  List<String> _selectedDetailsItems = [];
  get selectedDetailsItems => _selectedDetailsItems;
  set setSelectedDetailsItems(List list) {
    _selectedDetailsItems = list;
    notifyListeners();
  }

  void resetAddDetailsPage() {
    setNumberOfStoreys = 2;
    setNumberOfBedrooms = 4;
    setNumberOfBathrooms = 3;
    setSelectedPack = 1;
    resetCustomDetail();
    //TODO: Implement Reset actions
    print("User wants to reset the customizations");
  }

  ///To reset the details if selected any
  void resetCustomDetail() {
    List<String> list = [];
    setSelectedDetailsItems = list;
  }

  ///For custom Selection
  final List<String> _listForCustomSelection = [
    "Dining Room",
    "Living Room",
    "Living + Dining",
    "Kitchen",
    "Open Kitchen",
    "Balcony",
    "Dressing area",
    "Store Room",
    "Prayer Room",
    "Study Room",
    "Upper Living Room",
    "Game Room",
  ];

  get listForCustomSelection => _listForCustomSelection;

  final List<String> pack1 = [
    "Kitchen",
    "Living Room",
    "Dining Room",
    "Porch",
    "Sitout",
    "Store Room"
  ];

  final List<String> pack2 = [
    "Kitchen",
    "Living + Dining Room",
    "Porch",
    "Sitout",
    "Balcony",
  ];

  ///to determine the current page of the Collect details section
  int _pageIndexOfCollectSection = 0;
  int get pageIndexOfCollectSection => _pageIndexOfCollectSection;

  set setPageIndexOfCollectSection(int index) {
    _pageIndexOfCollectSection = index;
    notifyListeners();
  }

  ///Building materials Selected Option
  CustomizeOptions _buildingMaterialTypeSelected = CustomizeOptions.Best;
  get buildingMaterialTypeSelected => _buildingMaterialTypeSelected;

  set setBuildingMaterialTypeSelected(CustomizeOptions option) {
    _buildingMaterialTypeSelected = option;
    notifyListeners();
  }

   ///Flooring Types Selected Option
  CustomizeOptions _flooringTypeSelected = CustomizeOptions.Balanced;
  get flooringTypeSelected => _flooringTypeSelected;

  set setFlooringTypeSelected(CustomizeOptions option) {
    _flooringTypeSelected = option;
    notifyListeners();
  }

    ///Electricals Selected Option
  CustomizeOptions _electricalsTypeSelected = CustomizeOptions.Best;
  get electricalsTypeSelected => _electricalsTypeSelected;

  set setElectricalsTypeSelected(CustomizeOptions option) {
    _electricalsTypeSelected = option;
    notifyListeners();
  }

      ///plumbing Selected Option
  CustomizeOptions _plumbingTypeSelected = CustomizeOptions.Balanced;
  get plumbingTypeSelected => _plumbingTypeSelected;

  set setPlumbingTypeSelected(CustomizeOptions option) {
    _plumbingTypeSelected = option;
    notifyListeners();
  }

        ///Doors and Windows types Selected Option
  CustomizeOptions _doorsAndWindowsTypeSelected = CustomizeOptions.Balanced;
  get doorsAndWindowsTypeSelected => _doorsAndWindowsTypeSelected;

  set setDoorsAndWindowsTypeSelected(CustomizeOptions option) {
    _doorsAndWindowsTypeSelected = option;
    notifyListeners();
  }

 ///Optional Categores
 ///Kitchen Decor Selection Types
  CustomizeOptionalCategories _kitchenDecorTypeSelected = CustomizeOptionalCategories.Standard;
  get kitchenDecorTypeSelected => _kitchenDecorTypeSelected;

  set setKitchenDecorTypeSelected(CustomizeOptionalCategories option) {
    _kitchenDecorTypeSelected = option;
    notifyListeners();
  }

   ///Interior Decor Selection Types
  CustomizeOptionalCategories _interiorDecorTypeSelected = CustomizeOptionalCategories.Standard;
  get interiorDecorTypeSelected => _interiorDecorTypeSelected;

  set setInteriorDecorTypeSelected(CustomizeOptionalCategories option) {
    _interiorDecorTypeSelected = option;
    notifyListeners();
  }

     ///Exterior Decor Selection Types
  CustomizeOptionalCategories _exteriorDecorTypeSelected = CustomizeOptionalCategories.Standard;
  get exteriorDecorTypeSelected => _exteriorDecorTypeSelected;

  set setExteriorDecorTypeSelected(CustomizeOptionalCategories option) {
    _exteriorDecorTypeSelected = option;
    notifyListeners();
  }
}


enum CostEstimatePageTypes{
AddDetailsPage,
CustomizeItemsPage,
NiceToHaveItmesPage,
CostDisplayPage,
}