import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';
import 'package:traffic_counter_nueva_interfaz/pages/settings/widget.dart';
import 'package:traffic_counter_nueva_interfaz/pages/common/version_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  bool isSwitchedTutorial = false;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botón de volver
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: MainTheme.iconSettingsColor,
              onPressed: () => Navigator.pop(context),
            ),
            // Tarjeta SETTINGS
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: OptionCard(
                title: 'Settings',
                items: [
                  ItemRow(
                    icon: Icons.directions_car_filled_outlined,
                    title: 'Vehicles',
                  ),
                  ItemRow(
                    icon: Icons.person_outline_outlined,
                    title: 'Profile',
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                  ),
                  ItemRow(icon: Icons.public, title: 'Language'),
                  SwitchRow(
                    icon: Icons.wb_sunny_outlined,
                    title: 'Change theme',
                    value: isSwitched,
                    onChanged: (value) => setState(() => isSwitched = value),
                  ),
                  SwitchRow(
                    icon: Icons.school_outlined,
                    title: 'Tutorial',
                    value: isSwitchedTutorial,
                    onChanged:
                        (value) => setState(() => isSwitchedTutorial = value),
                  ),
                  ItemRow(
                    icon: Icons.login_rounded,
                    title: 'Log out',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
            // Tarjeta MORE
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: OptionCard(
                title: 'More',
                items: [
                  ItemRow(icon: Icons.rate_review_outlined, title: 'Rate us'),
                  ItemRow(
                    icon: Icons.menu_book_sharp,
                    title: 'Privacy policy and\n   Terms of use',
                  ),
                ],
              ),
            ),

            Expanded(child: const VersionText()),
          ],
        ),
      ),
    );
  }
}
