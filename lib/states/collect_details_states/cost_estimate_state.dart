import 'package:flutter/material.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/models/dashboard/selected_plan/selected_plan.dart';

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
    if (number != 3) {
      _lastSelectedPack = number;
    }
    _selectedPack = number;
    notifyListeners();
  }

  ///For going back to the last selected pack
  int _lastSelectedPack = 1;
  get lastSelectedPack => _lastSelectedPack;
  set setLastSelectedPack(int number) {
    _lastSelectedPack = number;
  }

  ///Custom Other details
  bool _isCustomOtherDetails = false;
  get isCustomOtherDetails => _isCustomOtherDetails;
  set setIsCustomOtherDetails(bool value) {
    _isCustomOtherDetails = value;
    notifyListeners();
  }

  // List<String> _selectedDetailsItems = [];

  Map<RoomTypes, String> _selectedDetailsItems = null;

  get selectedDetailsItems => _selectedDetailsItems;
  set setSelectedDetailsItems(List<String> list) {
    Map<RoomTypes, String> selectedMap = null;

    selectedMap = Map.fromIterable(list,
        key: (e) => customRequirementsSelection.keys.firstWhere(
            (element) => customRequirementsSelection[element] == e,
            orElse: () => null),
        value: (e) => e);
    _selectedDetailsItems = selectedMap;
    notifyListeners();
  }

  void resetCostEstimateSectionAllPages() {
    resetAddDetailsPage();
    resetCustomizePage();
    resetNiceToHave();
    setPageIndexOfCollectSection = 0;
  }

  void resetAddDetailsPage() {
    setNumberOfStoreys = 2;
    setNumberOfBedrooms = 4;
    setNumberOfBathrooms = 3;
    setSelectedPack = 1;
    resetCustomDetail();
  }

  ///to reset the Cutomize Page to the initial state
  void resetCustomizePage() {
    setBuildingMaterialTypeSelected = CustomizeOptions.Best;
    setFlooringTypeSelected = CustomizeOptions.Balanced;
    setElectricalsTypeSelected = CustomizeOptions.Best;
    setPlumbingTypeSelected = CustomizeOptions.Balanced;
    setDoorsAndWindowsTypeSelected = CustomizeOptions.Balanced;
  }

  ///to reset the NiceToHave Page to the initial state
  void resetNiceToHave() {
    setKitchenDecorTypeSelected = CustomizeOptions.Standard;
    setInteriorDecorTypeSelected = CustomizeOptions.Standard;
    setExteriorDecorTypeSelected = CustomizeOptions.None;
  }

  ///To reset the details if selected any
  void resetCustomDetail() {
    List<String> listMap = null;
    setSelectedDetailsItems = listMap;
  }

  // ///For custom Selection
  // final List<String> _listForCustomSelection = [
  //   "Dining Room",
  //   "Living Room",
  //   "Living + Dining",
  //   "Kitchen",
  //   "Open Kitchen",
  //   "Balcony",
  //   "Dressing area",
  //   "Store Room",
  //   "Prayer Room",
  //   "Study Room",
  //   "Upper Living Room",
  //   "Game Room",
  // ];

  get listForCustomSelection =>
      customRequirementsSelection.entries.map((e) => e.value).toList();

  final List<String> pack1 =
      requirementsBasePack1.entries.map((e) => e.value).toList();

  final List<String> pack2 =requirementsBasePack2.entries.map((e) => e.value).toList();


  ///to determine the current page of the Collect details section
  int _pageIndexOfCollectSection = 0;
  int get pageIndexOfCollectSection => _pageIndexOfCollectSection;

  set setPageIndexOfCollectSection(int index) {
    _pageIndexOfCollectSection = index;
    notifyListeners();
  }

  int _lastPageIndexOfTheSection = 2;
  int get lastPageIndexOfTheSection => _lastPageIndexOfTheSection;

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
  CustomizeOptions _kitchenDecorTypeSelected = CustomizeOptions.Standard;
  get kitchenDecorTypeSelected => _kitchenDecorTypeSelected;

  set setKitchenDecorTypeSelected(CustomizeOptions option) {
    _kitchenDecorTypeSelected = option;
    notifyListeners();
  }

  ///Interior Decor Selection Types
  CustomizeOptions _interiorDecorTypeSelected = CustomizeOptions.Standard;
  get interiorDecorTypeSelected => _interiorDecorTypeSelected;

  set setInteriorDecorTypeSelected(CustomizeOptions option) {
    _interiorDecorTypeSelected = option;
    notifyListeners();
  }

  ///Exterior Decor Selection Types
  CustomizeOptions _exteriorDecorTypeSelected = CustomizeOptions.None;
  get exteriorDecorTypeSelected => _exteriorDecorTypeSelected;

  set setExteriorDecorTypeSelected(CustomizeOptions option) {
    _exteriorDecorTypeSelected = option;
    notifyListeners();
  }

  BuildingRequirementsModel _buildingRequirementsModel = null;
  get buildingRequirementsModel => _buildingRequirementsModel;

  SelectedPlanModel _selectedPlanModel = null;
  get selectedPlanModel => _selectedPlanModel;

  void calculateRate() {
    _selectedPlanModel = SelectedPlanModel(
      buildingMaterialsType: _buildingMaterialTypeSelected,
      flooringType: _flooringTypeSelected,
      plumbingType: _plumbingTypeSelected,
      electricalsType: _electricalsTypeSelected,
      doorsAndWindowsType: _doorsAndWindowsTypeSelected,
      kitchenDecorType: _kitchenDecorTypeSelected,
      exteriorDecorType: _exteriorDecorTypeSelected,
      interiorDecorType: _interiorDecorTypeSelected,
      createdTimeStamp: setTimeStampInUTC(),
      updatedTimeStamp: setTimeStampInUTC(),
    );
    _buildingRequirementsModel = BuildingRequirementsModel(
      noOfStoreys: _selectedNumberOfStoreys,
      noOfBedrooms: _selectedNumberOfBedrooms,
      noOfBathrooms: _selectedNumberOfBathrooms,
      otherBuildingRequirements: OtherBuildingRequirementsModel(
        otherRequirementsList: [],
      ),
    );
  }
}

///Page Types
enum CostEstimatePageTypes {
  AddDetailsPage,
  CustomizeItemsPage,
  NiceToHaveItmesPage,
  CostDisplayPage,
}
