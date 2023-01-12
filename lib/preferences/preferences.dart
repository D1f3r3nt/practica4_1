import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _times = [];
  static bool _firstTime = true;

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

  static bool get firstTime {
    return _prefs.getBool('firstTime') ?? _firstTime;
  }

  static set firstTime(bool value) {
    _prefs.setBool('firstTime', value);
  }
}
