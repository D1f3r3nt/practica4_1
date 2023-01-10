import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime _currentTime;

  TimeProvider() : _currentTime = DateTime.now();

  int get hour {
    return _currentTime.hour.toInt();
  }

  int get minute {
    return _currentTime.minute.toInt();
  }

  int get second {
    return _currentTime.second.toInt();
  }

  updateTime() {
    _currentTime = DateTime.now();

    notifyListeners();
  }
}
