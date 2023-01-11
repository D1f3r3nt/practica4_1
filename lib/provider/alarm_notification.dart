import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class AlarmNotification {
  AlarmNotification();

  final _alarmNotification = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_notify_icon');

    final DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);

    await _alarmNotification.initialize(settings);
  }

  Future<NotificationDetails> _notifoicationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      additionalFlags: Int32List.fromList(<int>[4]),
    );

    DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notifoicationDetails();
    await _alarmNotification.show(id, title, body, details);
    FlutterRingtonePlayer.playAlarm(volume: 0.5, looping: false);
    Timer(const Duration(seconds: 10), () {
      FlutterRingtonePlayer.stop();
    });
  }
}
