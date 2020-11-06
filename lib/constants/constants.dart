import 'package:hellohuts_app/models/country.dart';

class Constants {
  static const Map<String, String> countryCode = {
    "INDIA": "+91",
  };
}

class Assets {
  static const String _imagesRoot = "assets/images/";
  static const String firebase = _imagesRoot + "firebase.png";
  static const String colored_circles_svg =
      _imagesRoot + "grouped_cricles_image.svg";
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

//Add Details Services Offered Screen
  static const String minus_light_icon = _iconsRoot + "Minus_light_icon.png";
  static const String plus_light_icon = _iconsRoot + "Plus_light_icon.png";
  static const String plus_bold_icon = _iconsRoot + "Plus_bold_icon.png";

  //Categories Icons
  static const String flame_bold_icon = _iconsRoot + "Flame_bold_icon.svg";
  static const String flame_light_icon = _iconsRoot + "Flame_light_icon.svg";
  static const String layers_bold_icon = _iconsRoot + "Layers_filled_icon.svg";

  //Post Detail icons
  static const String three_dots_icon = _iconsRoot + "Three-dots-bold_icon.png";

  //Comment
  static const String send_bold_icon = _iconsRoot + "Send_bold_icon.png";
}

class SessionData {
  static String countriesJson;
  static List<Country> countries;
}

class UIConstants {
  // Sentinel value for the system text scale factor option.
static const  double systemTextScaleFactorOption = -1;
}
