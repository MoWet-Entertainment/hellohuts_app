import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(StorageConstants.THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(StorageConstants.THEME_STATUS) ?? false;
  }
}
