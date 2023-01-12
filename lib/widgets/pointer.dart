import 'dart:math';

import 'package:flutter/material.dart';

/// Clase dedicada a las agujas, esta hecha de manera general para asi
/// usarla para las dos agujas
class Pointer extends StatelessWidget {
  final int time;
  final bool hour;
  const Pointer({required this.time, required this.hour});

  @override
  Widget build(BuildContext context) {
    /// Calculamos el angulo de las agujas, del calculo se obtiene la cantidad en radianes
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
                  color: hour ? Colors.grey[500] : Colors.white70,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: (hour ? Colors.grey[200] : Colors.white)!,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
