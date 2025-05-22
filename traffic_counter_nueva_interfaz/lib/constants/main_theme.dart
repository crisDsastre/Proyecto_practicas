import 'package:flutter/material.dart';

class MainTheme {
  static const Color primaryColor = Color(0xFF1C1C1E); // Color principal
  static const Color textColorDark = Color(0xFF2F2E75); // Color texto oscuro
  static const Color textColorLight = Color(0xFFF5F5F5); // Color texto claro
  static const Color backgroundColor = Color(0xFFF5F5F5); // Color de fondo
  static const Color backgroundColorSection = Color(
    0xFF2F2E75,
  ); // Color de fondo de secciones
  static const Color backgroundColorSectionLight = Color(
    0xFFCBCBDF,
  ); // Color de fondo de secciones claro
  static const Color iconHelpColor = Color(
    0xFFC0C0C0,
  ); // Color botones de ayuda
  static const Color iconSettingsColor = Color(
    0xFF2F2E75,
  ); // Color botones de herramientas
  static const Color secundaryColor = Color(0x994E5D6C); // Color secundario

  static ThemeData brightTheme = ThemeData(
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.lerp(FontWeight.w600, FontWeight.w700, 0.2),
        fontSize: 27,
        color: primaryColor,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.lerp(FontWeight.w600, FontWeight.w700, 0.3),
        fontSize: 25,
        color: textColorLight,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: secundaryColor,
      ),
    ),
  );
}
