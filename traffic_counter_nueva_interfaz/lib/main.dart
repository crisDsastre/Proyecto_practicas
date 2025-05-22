import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/page.dart';
import 'package:traffic_counter_nueva_interfaz/pages/profile/page.dart';
import 'package:traffic_counter_nueva_interfaz/pages/settings/page.dart';
import 'package:traffic_counter_nueva_interfaz/pages/home/page.dart';
import 'package:traffic_counter_nueva_interfaz/pages/detection_history/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to TrafficCounter!',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.brightTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => const WelcomePage(),
        '/settings':
            (_) =>
                const SettingsPage(), // Aqui se registran las rutas de la aplicacion
        '/profile': (context) => const ProfilePage(),
        '/camera_view': (context) => const NewDetectionPage(),
        '/detection_history': (_) => const MyDetectionsPage(),
      },
    );
  }
}
