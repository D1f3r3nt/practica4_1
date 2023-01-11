import 'package:flutter/material.dart';
import 'package:practica4_1/models/alarms_data.dart';
import 'package:provider/provider.dart';

import '../provider/alarm_notification.dart';
import '../provider/time_provider.dart';

class Alarm extends StatefulWidget {
  Alarm({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  final AlarmNotification notification = AlarmNotification();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeProvider>(context);
    notification.initialize();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          provider.times[widget.index].timeFormatted,
          style: const TextStyle(color: Colors.white70, fontFamily: 'Future'),
        ),
        leading: const Icon(
          Icons.access_time_outlined,
          color: Colors.white70,
        ),
        trailing: Switch(
          value: provider.times[widget.index].enable,
          activeColor: const Color.fromARGB(255, 255, 248, 53),
          inactiveThumbColor: const Color.fromARGB(255, 11, 11, 44),
          onChanged: (value) async {
            await notification.showNotification(
              id: 0,
              body: 'Hola',
              title: 'Hola Mundo',
            );
            setState(() {
              provider.times[widget.index].enable = value;
              provider.save();
            });
          },
        ),
      ),
    );
  }
}
