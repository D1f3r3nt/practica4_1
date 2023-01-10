import 'package:flutter/material.dart';
import 'package:practica4_1/provider/time_provider.dart';
import 'package:practica4_1/widgets/clock_time.dart';
import 'package:provider/provider.dart';

import '../widgets/clock.dart';
import '../widgets/draggable_bottom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Stream.periodic(
          const Duration(seconds: 1),
        ),
        builder: (context, snapshot) {
          Provider.of<TimeProvider>(context, listen: false).updateTime();

          return Stack(
            children: const [
              ClockTime(),
              Clock(),
              DraggableBottom(),
            ],
          );
        },
      ),
    );
  }
}
