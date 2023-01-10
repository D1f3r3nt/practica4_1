import 'dart:math';

import 'package:flutter/material.dart';

class Light extends StatelessWidget {
  final int seconds;
  const Light({required this.seconds});

  @override
  Widget build(BuildContext context) {
    final angle = (-pi * (seconds / -60)) * 2;
    return Transform.rotate(
      angle: angle,
      child: Transform.translate(
        offset: const Offset(0, -100),
        child: const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 255, 17, 0),
          radius: 8,
        ),
      ),
    );
  }
}
