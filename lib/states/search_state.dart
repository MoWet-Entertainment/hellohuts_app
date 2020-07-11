import 'package:hellohuts_app/states/app_state.dart';

class SearchState extends AppState {
  bool _isSearching = false;
  String _searchText= '';

  void setSearchText(String text) {
    _searchText = text;
    print(text);
    if (text.length > 0) {
      _isSearching = true;
    } else {
      _isSearching = false;
    }
    notifyListeners();
  }

  void resetSearch() {
    _searchText = "";
    _isSearching = false;
    notifyListeners();
  }

  String get searchText => _searchText;
  bool get isSearching => _isSearching;
}
