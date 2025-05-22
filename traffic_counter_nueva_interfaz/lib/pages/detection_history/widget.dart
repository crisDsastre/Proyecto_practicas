import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';

class DetectionCard extends StatelessWidget {
  final String title;
  final String address;
  final int vehicles;
  final List<String> tags;
  final VoidCallback onEdit;
  final VoidCallback onLoad;

  const DetectionCard({
    super.key,
    required this.title,
    required this.address,
    required this.vehicles,
    required this.tags,
    required this.onEdit,
    required this.onLoad,
  }); // Llamada correcta a super.key

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: MainTheme.backgroundColorSectionLight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: MainTheme.primaryColor,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: MainTheme.textColorDark,
            ),
          ),
          const SizedBox(height: 8),

          // Tags
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,

            children: [
              Wrap(
                spacing: 4,
                runSpacing: 0,
                alignment: WrapAlignment.start,

                children:
                    tags.map((tag) {
                      return Chip(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 0,
                        ),
                        label: Text(
                          "#$tag",
                          style: const TextStyle(
                            fontSize: 9, // 👈 más pequeño
                            color: MainTheme.textColorDark,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          side: const BorderSide(
                            color: MainTheme.textColorDark,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                      );
                    }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Vehículos + dirección
          Row(
            children: [
              const Icon(
                Icons.directions_car_filled,

                size: 20,
                color: MainTheme.iconSettingsColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "$vehicles     $address",
                  style: const TextStyle(
                    fontSize: 14,
                    color: MainTheme.textColorDark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Botones
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_square, size: 15),
                  label: const Text("Edit"),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: MainTheme.backgroundColorSection,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    foregroundColor: MainTheme.backgroundColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onLoad,
                  icon: const Icon(Icons.play_arrow_outlined, size: 25),
                  label: const Text("Load"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MainTheme.backgroundColorSection,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
