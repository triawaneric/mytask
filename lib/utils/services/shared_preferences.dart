import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future saveThemeState(value) async => prefs.setBool('theme', true);
  Future saveLanguageState(value) async => prefs.setBool('language', true);

  Future<bool?>getThemeState() async => prefs.getBool('theme');
  Future<bool?> getLanguageState() async => prefs.getBool('language');

  Future removeFirebaseData(String key) async => prefs.remove(key);
}
