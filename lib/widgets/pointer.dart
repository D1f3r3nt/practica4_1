import 'dart:math';

import 'package:flutter/material.dart';

class Pointer extends StatelessWidget {
  final int time;
  final bool hour;
  const Pointer({required this.time, required this.hour});

  @override
  Widget build(BuildContext context) {
    final angle = (-pi * (time / ((hour) ? -12 : -60))) * 2;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: angle,
        child: Transform.translate(
          offset: Offset(0, ((hour) ? 20 : 30)),
          child: Center(
            child: Container(
              height: (hour) ? 50 : 80,
              width: 4,
              decoration: BoxDecoration(
                color: hour ? Colors.black87 : Colors.grey[400],
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
