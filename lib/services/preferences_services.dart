import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  PreferencesServices._();

  static final PreferencesServices instance = PreferencesServices._();

  late SharedPreferencesAsync _prefs;

  Future<void> init() async {
    _prefs = SharedPreferencesAsync();
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return await _prefs.getBool(key);
  }
}
