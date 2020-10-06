import 'package:hellohuts_app/states/app_state.dart';

enum RoomTypes {
  Bedroom,
  Bathroom,
  Livingroom,
  Kitchen,
  Sitout,
  Diningroom,
  Storeroom
}

class CostEstimateState extends AppState {
  bool _needReset = false;

  set setReset(bool value) {
    _needReset = value;
    notifyListeners();
  }

  get needReset => _needReset;

  //Number of Storeys  section
  int _selectedNumberOfStoreys = 2;
  get selectedNumberOfStoryes => _selectedNumberOfStoreys;
  set setNumberOfStoreys(int noOfStoreys) {
    _selectedNumberOfStoreys = noOfStoreys;
    notifyListeners();
  }

//Number of Bedrooms
  int _selectedNumberOfBedrooms = 4;
  get selectedNumberOfBedrooms => _selectedNumberOfBedrooms;
  set setNumberOfBedrooms(int noOfBedrooms) {
    _selectedNumberOfBedrooms = noOfBedrooms;
    notifyListeners();
  }

//Number of Bathrooms
  int _selectedNumberOfBathrooms = 3;
  get selectedNumberOfBathrooms => _selectedNumberOfBathrooms;
  set setNumberOfBathrooms(int noOfBathrooms) {
    _selectedNumberOfBathrooms = noOfBathrooms;
    notifyListeners();
  }

//Other Details
  int _selectedPack = 1;
  get selectedPack => _selectedPack;
  set setSelectedPack(int number) {
    _selectedPack = number;
    notifyListeners();
  }

  //Custom Other details
  bool _isCustomOtherDetails = false;
  get isCustomOtherDetails => _isCustomOtherDetails;
  set setIsCustomOtherDetails(bool value) {
    _isCustomOtherDetails = value;
    notifyListeners();
  }

  void resetAddDetailsPage() {
    setNumberOfStoreys = 2;
    setNumberOfBedrooms = 4;
    setNumberOfBathrooms = 3;
    setSelectedPack = 1;
    //TODO: Implement Reset actions
    print("User wants to reset the customizations");
  }
}
