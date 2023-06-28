import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<bool> getBool(String key) async {
    final p = await _preferences;
    return p.getBool(key) ?? false;
  }

  static Future<bool> delete(String key) async {
    final p = await _preferences;
    return p.remove(key);
  }

  static Future setBool(String key, bool value) async {
    final p = await _preferences;
    return p.setBool(key, value);
  }

  static Future<int> getInt(String key) async {
    final p = await _preferences;
    return p.getInt(key) ?? 0;
  }

  static Future setInt(String key, int value) async {
    final p = await _preferences;
    return p.setInt(key, value);
  }

  static Future<String> getString(String key) async {
    final p = await _preferences;
    return p.getString(key) ?? '';
  }

  static Future setString(String key, String value) async {
    final p = await _preferences;
    return p.setString(key, value);
  }

  static Future<double> getDouble(String key) async {
    final p = await _preferences;
    return p.getDouble(key) ?? 0.0;
  }

  static Future setDouble(String key, double value) async {
    final p = await _preferences;
    return p.setDouble(key, value);
  }

  static Future<SharedPreferences> get _preferences =>
      SharedPreferences.getInstance();
}
