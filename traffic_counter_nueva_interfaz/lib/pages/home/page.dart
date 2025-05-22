import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';
import 'package:traffic_counter_nueva_interfaz/pages/home/widget.dart';
import 'package:traffic_counter_nueva_interfaz/pages/common/version_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.help_outline),
                  color: MainTheme.iconHelpColor,
                  onPressed: () {},
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  color: MainTheme.iconSettingsColor,
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Welcome to TrafficCounter!',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/logoApp.jpg',
                  height: size.height * 0.25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const NewDetectionButton(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: LoadDetectionButton(),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Made by',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/images/logoRovi.png',
                    height: size.height * 0.04,
                  ),
                ],
              ),
            ),

            SizedBox(child: Expanded(child: const VersionText())),
          ],
        ),
      ),
    );
  }
}
