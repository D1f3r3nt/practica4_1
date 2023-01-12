import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/providers.dart';

/// Clase dedicada al ListTile que sale en el desplegable,
/// Stateful debido a los Switchs
class AlarmWidget extends StatefulWidget {
  AlarmWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  final AlarmNotification notification = AlarmNotification();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeProvider>(context);
    /**
     * Inicializamos la funcion de notificaciones
     */
    notification.initialize();

    try {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(
            provider.times[widget.index].timeFormatted,
            style: const TextStyle(color: Colors.white70, fontFamily: 'Future'),
          ),
          leading: (provider.times[widget.index].enable)
              ? const Icon(
                  Icons.access_time_outlined,
                  color: Colors.white70,
                )
              : const Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.white70,
                ),
          trailing: Switch(
            value: provider.times[widget.index].enable,
            activeColor: const Color.fromARGB(255, 255, 248, 53),
            inactiveThumbColor: const Color.fromARGB(255, 11, 11, 44),
            onChanged: (value) async {
              setState(() {
                provider.times[widget.index].enable = value;
                provider.save();
              });
              /**
               * Funcion para poner la alarma o quitarla dependiendo de la eleccion del Switch
               */
              if (value) {
                notification.setAlarm(alarmsData: provider.times[widget.index]);
              } else {
                notification.removeAlarm(
                    alarmsData: provider.times[widget.index]);
              }
            },
          ),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
    return Container();
  }
}
