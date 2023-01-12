import 'dart:ffi';

import 'package:flutter/material.dart';

class AlarmsData {
  static final String _token = '<-->';

  TimeOfDay time;
  bool enable;

  AlarmsData({
    required this.time,
    required this.enable,
  });

  String get timeFormatted {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  int get id {
    return int.parse(
        '${time.hour.toString().padLeft(2, '0')}${time.minute.toString().padLeft(2, '0')}');
  }

  static AlarmsData decode(String encoded) {
    List<String> values = encoded.split(_token);
    List<String> time = values[0].split(':');

    return AlarmsData(
      time: TimeOfDay(
        hour: int.parse(time[0]),
        minute: int.parse(time[1]),
      ),
      enable: values[1] == 'T',
    );
  }

  static List<AlarmsData> decodeList(List<String> encodedList) {
    return encodedList.map(AlarmsData.decode).toList();
  }

  static List<String> encodeList(List<AlarmsData> decodedList) {
    return decodedList.map((alarm) => alarm.toString()).toList();
  }

  @override
  String toString() {
    return '${time.hour}:${time.minute}${_token}${enable ? 'T' : 'F'}';
  }
}
