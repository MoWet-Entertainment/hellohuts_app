import 'package:hellohuts_app/helper/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;
  var log = getLogger("LocalStorageService");

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  void saveStringToDisk(String key, dynamic content) {
    log.d(' saveStringToDisk: key : $key value: $content');
    _preferences.setString(key, content);
  }

  dynamic getFromDisk(String key) {
  var value  = _preferences.get(key);
  log.d(' getFromDisk:  key: $key value: $value');
  return value;
}
}
