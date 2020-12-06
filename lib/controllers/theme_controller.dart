import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellohuts_app/locators.dart';
import 'package:hellohuts_app/services/storage_services/shared_preference_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final _sharedPreferences = locator<SharedPreferencesService>();
  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    update();
    await _sharedPreferences.saveToDisk('theme', themeMode.toString().split('.')[1]);
  }

  getThemeModeFromPreferences() async {
    ThemeMode themeMode;
    String themeText = _sharedPreferences.getFromDisk('theme') ?? 'system';
    try {
      themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    setThemeMode(themeMode);
  }
}
