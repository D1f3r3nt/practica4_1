import 'package:flutter/material.dart';
import 'package:practica4_1/provider/time_provider.dart';
import 'package:provider/provider.dart';

class ClockTime extends StatelessWidget {
  const ClockTime({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.2),
        child: Text(
          '${_hour(context)}:${_minute(context)}',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  String _hour(BuildContext context) {
    var _hour = Provider.of<TimeProvider>(context).hour;
    return _hour.toString().padLeft(2, '0');
  }

  String _minute(BuildContext context) {
    var _minute = Provider.of<TimeProvider>(context).minute;
    return _minute.toString().padLeft(2, '0');
  }
}
