import 'package:flutter/material.dart';

import '../models/models.dart';
import '../preferences/preferences.dart';

class TimeProvider extends ChangeNotifier {
  DateTime _currentTime;
  List<AlarmsData> _times = AlarmsData.decodeList(Preferences.times);

  final String KEY = '<-->';

  TimeProvider() : _currentTime = DateTime.now();

  List<AlarmsData> get times {
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

    Future.delayed(const Duration(seconds: 1), () {
      notifyListeners();
    });
  }

  save() {
    Preferences.times = AlarmsData.encodeList(_times);

    notifyListeners();
  }

  Future<AlarmsData?> selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (newTime == null) return null;

    final newAlarm = AlarmsData(time: newTime, enable: true);

    _times.removeWhere((element) =>
        element.time.hour == newAlarm.time.hour &&
        element.time.minute == newAlarm.time.minute);

    _times.add(newAlarm);

    save();

    return newAlarm;
  }
}