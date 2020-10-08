import 'package:hellohuts_app/models/cost_estimation/cost_estimation.dart';
import 'package:hellohuts_app/states/app_state.dart';

class CostEstimateState extends AppState {
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

  ///to determine the current page of the Collect details section\
  int _pageIndexOfCollectSection = 0;
  int get pageIndexOfCollectSection => _pageIndexOfCollectSection;

  set setPageIndexOfCollectSection(int index) {
    _pageIndexOfCollectSection = index;
    notifyListeners();
  }

  ///Building materials Selected Option
  CustomizeOptions _buildingMaterialSelected = CustomizeOptions.Best;
  get buildingMaterialSelected => _buildingMaterialSelected;

  set setBuildingMaterialSelected(CustomizeOptions option) {
    _buildingMaterialSelected = option;
    notifyListeners();
  }
}
