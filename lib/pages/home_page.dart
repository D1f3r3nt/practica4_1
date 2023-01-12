import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../preferences/preferences.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

/// Usamos Stateful para el Discovery
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// Comprobamos si es la primera vez que entra
      if (Preferences.firstTime) {
        FeatureDiscovery.discoverFeatures(
            context, <String>['new', 'trash', 'info']);

        Preferences.firstTime = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TimeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 36, 165),
        shadowColor: const Color.fromARGB(255, 55, 36, 165),
        elevation: 0,
        actions: [
          InfoDiscovery(
            description:
                'En cualquier caso o duda, aqui obtendremos la información',
            id: 'info',
            title: 'Información',
            child: IconButton(
              onPressed: () {
                CustomFeedback.showAlert(
                    'Información',
                    'Para poder borrar alertas se deben poner los SWITCH apagados',
                    context);
              },
              icon: const Icon(Icons.info),
              color: Colors.white70,
            ),
          )
        ],
        leading: InfoDiscovery(
          description:
              'Se eliminar todas aquellas alarmas que esten desactivadas, en caso contrario no se eliminaran',
          id: 'trash',
          title: 'Eliminar',
          child: IconButton(
            onPressed: () {
              /// Miramos si hay alguna alerta deshabilitada, sino mostramos error
              if (!data.times.any((element) => !element.enable)) {
                CustomFeedback.showErrSnackbar(
                    'No hay nada para borrar', context);
                return;
              }

              /// Quitamos todas las deshabilitadas
              data.times.removeWhere((element) => !element.enable);

              /// Guardamos
              data.save();
            },
            icon: const Icon(FontAwesomeIcons.trash),
            color: Colors.white70,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            stops: [0.2, 0.4, 0.8],
            colors: [
              Color.fromARGB(255, 55, 36, 165),
              Color.fromARGB(255, 45, 30, 128),
              Color.fromARGB(255, 0, 18, 71),
            ],
          ),
        ),

        /// Creamos un repetidor que nos refresque la pagina cada segundo, mediante un Stream
        child: StreamBuilder(
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
      ),
    );
  }
}
