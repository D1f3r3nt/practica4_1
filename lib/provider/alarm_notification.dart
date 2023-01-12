import 'dart:async';
import 'dart:typed_data';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:practica4_1/models/alarms_data.dart';

class AlarmNotification extends ChangeNotifier {
  static final _alarmNotification = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    AndroidAlarmManager.initialize();

    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@drawable/ic_notify_icon');

    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);

    await _alarmNotification.initialize(settings);
  }

  static Future<NotificationDetails> _notifoicationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      additionalFlags: Int32List.fromList(<int>[4]),
      colorized: true,
      color: const Color.fromARGB(255, 11, 11, 44),
    );

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails();

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
  }

  static void _showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notifoicationDetails();
    await _alarmNotification.show(id, title, body, details);
  }

  setAlarm({required AlarmsData alarmsData}) async {
    await AndroidAlarmManager.oneShotAt(
      getTime(alarmsData.time),
      alarmsData.id,
      play,
      allowWhileIdle: true,
      exact: true,
      alarmClock: true,
      wakeup: true,
    );
  }

  removeAlarm({required AlarmsData alarmsData}) async {
    await AndroidAlarmManager.cancel(alarmsData.id);
  }

  DateTime getTime(TimeOfDay timeOfDay) {
    DateTime _now = DateTime.now();
    if (_now.hour > timeOfDay.hour ||
        (_now.hour == timeOfDay.hour && _now.minute >= timeOfDay.minute)) {
      _now = _now.add(const Duration(days: 1));
    }
    return DateTime(
      _now.year,
      _now.month,
      _now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  static void play() {
    FlutterRingtonePlayer.playAlarm(volume: 0.5, looping: false);
    Timer(const Duration(seconds: 10), () {
      FlutterRingtonePlayer.stop();
    });

    _showNotification(
      id: 0,
      title: 'Alarma',
      body: 'Tal y como has programado se esta ejecutando la alarma',
    );
  }
}
