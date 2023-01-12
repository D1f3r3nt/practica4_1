import 'dart:math';

import 'package:flutter/material.dart';

/// Clase dedicada a la luz de los segundos
class Light extends StatelessWidget {
  final int seconds;
  const Light({required this.seconds});

  @override
  Widget build(BuildContext context) {
    /// Calculamos el angulo del punto, del calculo se obtiene la cantidad en radianes
    final angle = (-pi * (seconds / -60)) * 2;

    /// Preparamos la posicion y rotacion
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: const Offset(0, -100),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10, color: Color.fromARGB(255, 255, 247, 12))
            ],
          ),
          child: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 248, 53),
            radius: 8,
          ),
        ),
      ),
    );
  }
}
