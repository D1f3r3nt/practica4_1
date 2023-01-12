import 'package:shared_preferences/shared_preferences.dart';

/// Clase dedicada a tratar los datos de la memoria
class Preferences {
  static late SharedPreferences _prefs;

  static List<String> _times = [];
  static bool _firstTime = true;

  /// Clase para iniciar el preferences
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Creamos getter para asi realizar la consulta a la vez,
  /// en caso de no estar guardado devolvemos el valor por defecto
  static List<String> get times {
    return _prefs.getStringList('times') ?? _times;
  }

  /// Creamos setter para asi guardar la informacion a la vez
  static set times(List<String> times) {
    _times = times;
    _prefs.setStringList('times', times);
  }

  /// Creamos getter para asi realizar la consulta a la vez,
  /// en caso de no estar guardado devolvemos el valor por defecto
  static bool get firstTime {
    return _prefs.getBool('firstTime') ?? _firstTime;
  }

  /// Creamos setter para asi guardar la informacion a la vez
  static set firstTime(bool value) {
    _prefs.setBool('firstTime', value);
  }
}
