import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/pages/profile/widget.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';
import 'package:traffic_counter_nueva_interfaz/pages/common/version_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ FILA: Flecha + Título
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: MainTheme.iconSettingsColor,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 50),
                  Text(
                    'Profile',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: MainTheme.textColorDark,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.05),

            const ProfileCard(),

            const Expanded(child: VersionText()),
          ],
        ),
      ),
    );
  }
}
