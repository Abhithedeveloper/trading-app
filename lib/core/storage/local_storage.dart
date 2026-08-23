import 'package:shared_preferences/shared_preferences.dart';

final class LocalStorage {
  LocalStorage(this._preferences);

  final SharedPreferences _preferences;

  Future<String?> getString(String key) async {
    return _preferences.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}