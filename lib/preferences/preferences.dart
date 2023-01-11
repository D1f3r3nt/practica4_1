import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _times = [];

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> get times {
    return _prefs.getStringList('times') ?? _times;
  }

  static set times(List<String> times) {
    _times = times;
    _prefs.setStringList('times', times);
  }
}
