import 'package:hellohuts_app/models/country.dart';

class Constants {
  static const Map<String, String> countryCode = {
    "INDIA": "+91",
  };
}

class Assets {
  static String _imagesRoot = "assets/images/";
  static String firebase = _imagesRoot + "firebase.png";

  static const double fourBy1 = 4.0;
  static const double fourBy2 = 8.0;
  static const double fourBy3 = 12.0;
  static const double fourBy4 = 16.0;

  static const double eightBy1 = 8.0;
  static const double eightBy2 = 16.0;
  static const double eightBy3 = 24.0;
  static const double eightBy4 = 32.0;

  static const double sixteenBy1 = 16.0;
  static const double sixteenBy2 = 32.0;
  static const double sixteenBy3 = 48.0;
  static const double sixteenBy4 = 64.0;
}

class HelloIcons {
  static const String _iconsRoot = "assets/icons/";

  //Nav bar Items
  static const String explore_bold_icon =
      _iconsRoot + "Discovery_bold_icon.png";
  static const String explore_light_icon =
      _iconsRoot + "Discovery_light_icon.png";
  static const String category_bold_icon =
      _iconsRoot + "Category_bold_icon.png";
  static const String category_light_icon =
      _iconsRoot + "Category_light_icon.png";
  static const String home_bold_icon = _iconsRoot + "Home_bold_icon.png";
  static const String home_light_icon = _iconsRoot + "Home_light_icon.png";
  static const String bookmark_bold_icon =
      _iconsRoot + "Bookmark_new_bold_icon.png";
  static const String bookmark_light_icon =
      _iconsRoot + "Bookmark_new_light_icon.png";
  static const String profile_bold_icon = _iconsRoot + "Profile_bold_icon.png";
  static const String profile_light_icon =
      _iconsRoot + "Profile_light_icon.png";

//App bar Items
  static const String menu_icon = _iconsRoot + "Menu_light_icon.png";
  static const String search_icon = _iconsRoot + "Search_light_icon.png";
  static const String search_svg_icon = _iconsRoot + "Search_light_icon.svg";

//Quick Pick Items
  static const String professionals_icon =
      _iconsRoot + "Professionals_light_icon.png";
  static const String cost_estimate_icon =
      _iconsRoot + "Cost_estimate_light_icon.png";
  static const String materials_icon = _iconsRoot + "Materials_light_icon.png";
  static const String more_items_icon =
      _iconsRoot + "More_items_light_icon.png";

  //Feed Post Items
  static const String heart_bold_icon =
      _iconsRoot + "Heart_Filled_bold_icon.png";
  static const String comment_bold_icon = _iconsRoot + "Chat_bold_icon.png";
  static const String share_bold_icon = _iconsRoot + "Share_bold_icon.png";

//Search Screen
  static const String close_circle_bold_icon =
      _iconsRoot + "Close Circle_bold_icon.png";

  static const String location_bold_icon =
      _iconsRoot + "Location_bold_icon.png";
  static const String bag_bold_icon = _iconsRoot + "Bag_bold_icon.png";
  static const String chart_bold_icon = _iconsRoot + "Chart_bold_icon.png";

  //Arrows for App Bar
  static const String left_arrow_light_icon =
      _iconsRoot + "Arrow_left_icon.png";
  static const String right_arrow_light_icon =
      _iconsRoot + "Arrow_right_icon.png";
  static const String up_arrow_light_icon = _iconsRoot + "Arrow_up_icon.png";
  static const String down_arrow_light_icon =
      _iconsRoot + "Arrow_down_icon.png";
}

class SessionData {
  static String countriesJson;
  static List<Country> countries;
}
