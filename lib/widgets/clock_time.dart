import 'package:flutter/material.dart';

import '../providers/providers.dart';

/// Clase dedicada a la hora que sale en formato de texto
class ClockTime extends StatelessWidget {
  const ClockTime({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.1),
        child: Text(
          '${_hour(context)}:${_minute(context)}',
          style: const TextStyle(
              fontSize: 40,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontFamily: 'Future',
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 8,
                ),
              ]),
        ),
      ),
    );
  }

  /// Formateador de la hora
  String _hour(BuildContext context) {
    var _hour = Provider.of<TimeProvider>(context).hour;
    return _hour.toString().padLeft(2, '0');
  }

  /// Formateador de los minutos
  String _minute(BuildContext context) {
    var _minute = Provider.of<TimeProvider>(context).minute;
    return _minute.toString().padLeft(2, '0');
  }
}
