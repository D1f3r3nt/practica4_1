import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica4_1/provider/time_provider.dart';
import 'package:provider/provider.dart';

import 'new-time.dart';

class DraggableBottom extends StatelessWidget {
  const DraggableBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimeProvider>(context);
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
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: provider.times.length + 1,
                  itemBuilder: (context, index) {
                    return NewTime(provider: provider);
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
