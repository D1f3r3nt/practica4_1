import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime _currentTime;
  List<String> _times = [];

  TimeProvider() : _currentTime = DateTime.now();

  List<String> get times {
    return _times;
  }

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

    Future.delayed(Duration(seconds: 1), () {
      notifyListeners();
    });
  }

  selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime == null) return;

    _times.add(newTime.toString());

    notifyListeners();
  }
}
