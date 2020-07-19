import 'package:hellohuts_app/constants/mock_search.dart';
import 'package:hellohuts_app/models/search/search_item.dart';
import 'package:hellohuts_app/states/app_state.dart';

class SearchState extends AppState {
  bool _isSearching = false;
  String _searchText = '';
  List<SearchItem> searchHistory = [];
  List<SearchItem> _searchList = [];

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

  void onSubmitAction(SearchItem item) {
    searchHistory.add(item);
  }

  String get searchText => _searchText;
  bool get isSearching => _isSearching;

  List<SearchItem> getSearchResults() {
    //TODO: Modify this code to fetch values from DB

    var list = MockSearch.mockSearch;
    for (var item in list) {
      var temp = SearchItem.fromJson(item);
      _searchList.add(temp);
    }

    List<SearchItem> searchResults = [];
    if (_searchText.length != 0 || _searchText.isNotEmpty) {
      // for (SearchItem item in _searchList) {
      //   if (item.searchString.toLowerCase().contains(_searchText)) {
      //     searchResults.add(item);
      //   }
      // }
      searchResults = _searchList
          .where((element) =>
              element.searchString.toLowerCase().contains(_searchText))
          .take(6).toList();
      searchResults.sort();

      //Removing duplicates if any
      final distinctResults = [
        ...{...searchResults}
      ];

      return distinctResults;
    }
  }
}
