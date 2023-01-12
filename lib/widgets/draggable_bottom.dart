import 'dart:ui';

import 'package:flutter/material.dart';

import '../providers/providers.dart';
import 'widgets.dart';

/// Clase dedicada a la parte extensible de abajo
class DraggableBottom extends StatelessWidget {
  const DraggableBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeProvider>(context);
    final _alarmProvider =
        Provider.of<AlarmNotification>(context, listen: false);

    /// Configuramos los limites y la parte visual
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.25),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Scrollbar(
                trackVisibility: false,
                thumbVisibility: false,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: provider.times.length + 1,
                  itemBuilder: (context, index) {
                    if (provider.times.length == index) {
                      return InfoDiscovery(
                        description:
                            'Aqui podremos poner todas las alarmas a nuestro gusto',
                        id: 'new',
                        title: 'Alarmas',
                        below: false,
                        child: NewTime(
                          provider: provider,
                          alarmNotification: _alarmProvider,
                        ),
                      );
                    }
                    return AlarmWidget(index: index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
