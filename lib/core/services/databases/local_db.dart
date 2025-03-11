import 'package:amrtmm_project/core/services/keys/db_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

class LocalDB {
  static final SharedPreferences _prefs = sl<SharedPreferences>();

  static Future<bool> saveUserConfiguration(
      {required String accessToken, required bool isLoggedIn}) async {
    final data = await Future.wait({
      _prefs.setString(DBKeys.accessToken, accessToken),
      _prefs.setBool(DBKeys.isLoggedIn, isLoggedIn),
    });
    return data.contains(false) ? false : true;
  }

  static Future<bool> logoutUser() async {
    final data = await Future.wait({
      _prefs.remove(DBKeys.isLoggedIn),
      _prefs.remove(DBKeys.accessToken),
    });
    return data.contains(false) ? false : true;
  }

  static Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  static Future<bool> clearInt(String key) async {
    return await _prefs.remove(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }
}
