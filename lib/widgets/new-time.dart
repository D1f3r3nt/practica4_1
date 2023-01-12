import 'package:flutter/material.dart';

import '../models/models.dart';
import '../providers/providers.dart';

/// Clase dedicada al texto de "Nueva alerta",
/// con el fin de poder crear una nueva alerta
class NewTime extends StatelessWidget {
  const NewTime(
      {Key? key, required this.provider, required this.alarmNotification})
      : super(key: key);

  final TimeProvider provider;
  final AlarmNotification alarmNotification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        /// Funcion de crear la alerta y registrar la alerta
        onTap: () async {
          final AlarmsData? newAlarm = await provider.selectTime(context);
          if (newAlarm == null) return;

          alarmNotification.setAlarm(alarmsData: newAlarm);
        },
        child: const ListTile(
          iconColor: Colors.white70,
          leading: Icon(Icons.add),
          title: Text(
            'Nueva alarma',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'TextFuture',
            ),
          ),
        ),
      ),
    );
  }
}
