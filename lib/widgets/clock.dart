import 'package:flutter/material.dart';
import 'package:practica4_1/provider/time_provider.dart';
import 'package:provider/provider.dart';

import 'light.dart';
import 'pointer.dart';

class Clock extends StatelessWidget {
  const Clock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _timeProvider = Provider.of<TimeProvider>(context);
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          /*  */
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.white54,
                    blurRadius: 5.0,
                    offset: Offset(-1.0, -1.0) //keep shadow centered
                    ),
                BoxShadow(
                    color: Color.fromARGB(255, 6, 6, 31),
                    blurRadius: 5.0,
                    offset: Offset(1.0, 1.0) //keep shadow centered
                    )
              ],
            ),
            child: const CircleAvatar(
              radius: 100,
              backgroundColor: Color.fromARGB(255, 11, 11, 44),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.white38,
                    blurRadius: 5.0,
                    offset: Offset(-1.0, -1.0) //keep shadow centered
                    ),
                BoxShadow(
                    color: Color.fromARGB(255, 27, 27, 58),
                    blurRadius: 5.0,
                    offset: Offset(1.0, 1.0) //keep shadow centered
                    )
              ],
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromARGB(255, 35, 35, 76),
            ),
          ),
          Pointer(hour: true, time: _timeProvider.hour),
          Pointer(hour: false, time: _timeProvider.minute),
          Light(seconds: _timeProvider.second),
        ],
      ),
    );
  }
}
