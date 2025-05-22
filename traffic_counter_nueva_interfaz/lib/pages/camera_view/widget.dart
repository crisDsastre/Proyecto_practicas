import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/widgets/save_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/bloc/camera_view_bloc.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/bloc/camera_view_event.dart';

/// Imagen con contador desplegable y botón de ayuda superpuestos
class DetectionImage extends StatelessWidget {
  final Size size;
  const DetectionImage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: size.height * 0.60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: AssetImage('assets/images/example_fotoCars.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 15,
          right: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Contador con flecha
              VehicleCounterDropdown(
                totalVehicles: 16,
                vehicleTypes: {
                  'Cars': 13,
                  'Trucks': 2,
                  'Buses': 0,
                  'Motorcycles': 1,
                  'Bicycles': 0,
                },
              ),

              // Botón ayuda
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.help_sharp),
                color: MainTheme.iconHelpColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Fila: History · Clear · Curve, con divisores verticales y Divider con sombra
class DetectionActionButtons extends StatelessWidget {
  const DetectionActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.067,
          child: Row(
            children: [
              Expanded(
                // Botón History
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detection_history');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.article_outlined,
                          size: 28,
                          color: MainTheme.iconSettingsColor,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 12,

                            color: MainTheme.textColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              VerticalDivider(
                thickness: 1,
                indent: 5,
                color: MainTheme.backgroundColorSection,
                width: 1,
              ),
              Expanded(
                // Botón Clear
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CameraViewBloc>().add(
                        ClearDrawing(),
                      ); // Borra la línea dibujada
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.cleaning_services_outlined,
                          size: 28,
                          color: MainTheme.iconSettingsColor,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 12,
                            color: MainTheme.textColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              VerticalDivider(
                thickness: 1,
                indent: 5,

                color: MainTheme.backgroundColorSection,
                width: 1,
              ),
              Expanded(
                // Botón Curve
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CameraViewBloc>().add(
                        EnableDrawing(isCurve: true),
                      ); // Activa el modo de dibujo (curva)
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          FontAwesomeIcons.route,
                          size: 28,
                          color: MainTheme.iconSettingsColor,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Curve',
                          style: TextStyle(
                            fontSize: 12,
                            color: MainTheme.textColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Divider con sombra
        Divider(
          thickness: 1,
          indent: 10,
          endIndent: 10,
          height: 1,
          color: MainTheme.backgroundColorSection,
        ),
      ],
    );
  }
}

class DetectionBottomControls extends StatelessWidget {
  const DetectionBottomControls({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height * 0.06;
    final playSize = MediaQuery.of(context).size.height * 0.12;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Botón de ajustes
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: MainTheme.backgroundColorSection,
                width: 1.5,
              ),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: const Icon(Icons.settings_outlined),
              iconSize: size * 0.7,
              color: MainTheme.iconSettingsColor,
              splashRadius: size * 0.5,
            ),
          ),

          // Botón principal de reproducción
          SizedBox(
            height: playSize,
            width: playSize,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MainTheme.backgroundColorSection,
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 70,
              ),
            ),
          ),

          // Botones Save y Delete
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: MainTheme.backgroundColorSection,
                    width: 1.5,
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    showSaveDialog(context);
                  },
                  icon: const Icon(Icons.save_outlined),
                  iconSize: size * 0.6,
                  color: MainTheme.backgroundColorSection,
                  splashRadius: size * 0.5,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: MainTheme.backgroundColorSection,
                    width: 1.5,
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    // Acción de borrar
                  },
                  icon: const Icon(Icons.delete_outline_rounded),
                  iconSize: size * 0.6,
                  color: MainTheme.backgroundColorSection,
                  splashRadius: size * 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VehicleCounterDropdown extends StatelessWidget {
  final int totalVehicles;
  final Map<String, int> vehicleTypes;

  const VehicleCounterDropdown({
    super.key,
    required this.totalVehicles,
    required this.vehicleTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          "Vehicles : $totalVehicles",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: MainTheme.textColorDark,
          ),
        ),

        children: [
          const Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            height: 1,
            color: MainTheme.backgroundColorSection,
          ),
          ...vehicleTypes.entries.map(
            (entry) => ListTile(
              dense: true,
              title: Text(
                "${entry.key} : ${entry.value}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 0,

                  color: MainTheme.textColorDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
