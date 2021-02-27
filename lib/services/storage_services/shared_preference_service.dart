import 'package:flutter/material.dart';
import 'package:hellohuts_app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance =
          SharedPreferencesService._(await SharedPreferences.getInstance());
    }

    return _instance;
  }

  final SharedPreferences _preferences;
  SharedPreferencesService._(this._preferences);

  void clearPreferences() {
    _preferences.clear();
  }

  dynamic getFromDisk(String key) {
    var value = _preferences.get(key);
    return value;
  }

  void saveToDisk(String key, dynamic content) {
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  //for checking the state of the user wrt app
  bool get hasSignedUp => getFromDisk(StorageConstants.SignedUpKey) ?? false;
  set hasSignedUp(bool val) => saveToDisk(StorageConstants.SignedUpKey, val);

  bool get hasLoggedIn => getFromDisk(StorageConstants.LoggedInKey) ?? false;
  set hasLoggedIn(bool val) => saveToDisk(StorageConstants.LoggedInKey, val);
}
