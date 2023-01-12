import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';

/// Clase dedicada a prepara la Informacion que se mostrara
/// en el modo de Discovery
class InfoDiscovery extends StatelessWidget {
  InfoDiscovery(
      {required this.child,
      required this.id,
      required this.title,
      required this.description,
      this.below = true});

  final Widget child;
  final String id;
  final String title;
  final String description;
  bool below;

  @override
  Widget build(BuildContext context) {
    return DescribedFeatureOverlay(
      featureId: id,
      tapTarget: Container(),
      backgroundColor: const Color.fromARGB(255, 11, 11, 44),
      targetColor: Colors.transparent,
      contentLocation: below ? ContentLocation.below : ContentLocation.above,
      overflowMode: OverflowMode.wrapBackground,
      title: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 248, 53),
          shadows: [
            Shadow(
              color: Color.fromARGB(255, 255, 247, 12),
              blurRadius: 10,
            )
          ],
          fontFamily: 'TextFuture',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        description,
        style: const TextStyle(
          color: Color.fromARGB(255, 248, 244, 112),
          fontFamily: 'TextFuture',
          fontSize: 15,
        ),
      ),
      child: child,
    );
  }
}
