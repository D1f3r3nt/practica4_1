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
          const CircleAvatar(
            radius: 100,
            backgroundColor: Colors.blueGrey,
          ),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.pink,
          ),
          Pointer(hour: true, time: _timeProvider.hour),
          Pointer(hour: false, time: _timeProvider.minute),
          Light(seconds: _timeProvider.second),
        ],
      ),
    );
  }
}
