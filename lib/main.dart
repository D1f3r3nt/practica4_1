import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'preferences/preferences.dart';
import 'providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(
          create: (context) => AlarmNotification(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FeatureDiscovery(
              recordStepsInSharedPreferences: false,
              child: HomePage(),
            ),
      },
      theme: ThemeData(fontFamily: 'TextFuture'),
    );
  }
}
