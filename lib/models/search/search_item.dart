import 'dart:convert';

enum SearchType { Location, Professionals, Material, Building, Other }

class SearchItem {
  final String searchString;
  final SearchType searchType;
  final String timeStamp;
  SearchItem({
    this.searchString,
    this.searchType,
    this.timeStamp,
  });

  SearchItem copyWith({
    String searchString,
    SearchType searchType,
    String timeStamp,
  }) {
    return SearchItem(
      searchString: searchString ?? this.searchString,
      searchType: searchType ?? this.searchType,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'search_string': searchString,
      'search_type': _getSearchType(searchType),
      'time_stamp': timeStamp,
    };
  }

  _getSearchType(SearchType type) {
    switch (type) {
      case SearchType.Building:
        return 'building';
      case SearchType.Location:
        return 'location';
      case SearchType.Material:
        return 'material';

      case SearchType.Professionals:
        return 'professionals';
      case SearchType.Other:
        return 'other';
      default:
        return 'other';
    }
  }

 static  _setSearchType(String type) {
    switch (type) {
      case 'building':
        return SearchType.Building;

      case 'location':
        return SearchType.Location;

      case 'material':
        return SearchType.Material;

      case 'professionals':
        return SearchType.Professionals;

      case 'other':
        return SearchType.Other;
      default:
        return SearchType.Other;
    }
  }

  static SearchItem fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchItem(
      searchString: map['searchString'],
      searchType:_setSearchType(map['searchType']),
      timeStamp: map['timeStamp'],
    );
  }

  String toJson() => json.encode(toMap());

  static SearchItem fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchItem(searchString: $searchString, searchType: $searchType, timeStamp: $timeStamp)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchItem &&
        o.searchString == searchString &&
        o.searchType == searchType &&
        o.timeStamp == timeStamp;
  }

  @override
  int get hashCode =>
      searchString.hashCode ^ searchType.hashCode ^ timeStamp.hashCode;
}
