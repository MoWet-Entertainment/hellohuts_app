import 'package:hellohuts_app/states/app_state.dart';

class CostEstimateState extends AppState {
  int _selectedNumberOfStoreys = 2;
  get selectedNumberOfStoryes => _selectedNumberOfStoreys;
  set setSelectedNumberOfStoreys(int noOfStoreys) {
    _selectedNumberOfStoreys = noOfStoreys;
    notifyListeners();
  }

  void resetAddDetailsPage() {
    setSelectedNumberOfStoreys = 2;
    //TODO: Implement Reset actions
    print("User wants to reset the customizations");
  }
}
