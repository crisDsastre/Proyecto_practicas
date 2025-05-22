import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';

/// Componente de tarjeta para bloques como 'Settings' o 'More'
class OptionCard extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const OptionCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),

      decoration: BoxDecoration(
        color: MainTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MainTheme.backgroundColorSection, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 7,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MainTheme.textColorDark,
              ),
            ),
          ),

          // Línea divisoria
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 1),
            child: const Divider(
              indent: 0,
              endIndent: 0,
              thickness: 1,
              color: MainTheme.backgroundColorSection,
            ),
          ),

          // Ítems
          ...items,
        ],
      ),
    );
  }
}

/// Fila simple con icono + texto + flecha
class ItemRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ItemRow({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1, left: 2),
                    child: Icon(
                      icon,
                      size: 18,
                      color: MainTheme.iconSettingsColor,
                    ),
                  ),

                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: MainTheme.textColorDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: onTap, //  onTap definido como parámetro
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: MainTheme.iconSettingsColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fila con interruptor (switch)
class SwitchRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const SwitchRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1, bottom: 1, left: 2),
                  child: Icon(
                    icon,
                    size: 18,
                    color: MainTheme.iconSettingsColor,
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      color: MainTheme.textColorDark,
                    ),
                  ),
                ),
              ],
            ),
            Transform.scale(
              scale: 0.8, // igual al tamaño de la flecha de ItemRow
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeTrackColor: const Color(0xFF2E2A78),
                activeColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                inactiveThumbColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
