// lib/pages/common/version_text.dart
import 'package:flutter/material.dart';

/// Este widget muestra el texto de versión de la app.
/// En todas las pantallas de forma reutilizable.
class VersionText extends StatelessWidget {
  final String version;

  const VersionText({this.version = 'Version X.Y.Z', super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
        child: Text(
          version,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: const Color(0xFF4E5D6C)),
        ),
      ),
    );
  }
}
