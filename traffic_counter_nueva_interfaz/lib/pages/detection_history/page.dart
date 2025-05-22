import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart';
import 'package:traffic_counter_nueva_interfaz/pages/detection_history/widget.dart';

class MyDetectionsPage extends StatelessWidget {
  const MyDetectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo
    final List<Map<String, dynamic>> detections = [
      {
        'title': 'Detection name #1',
        'address': 'Avd. de la prueba X',
        'vehicles': 16,
        'tags': ['TagsEquipo1', 'TagsEquipo1', 'TagsEquipo1'],
      },
      {
        'title': 'Detection name #1',
        'address': 'Avd. de la prueba X',
        'vehicles': 16,
        'tags': ['TagsEquipo1', 'TagsEquipo1', 'TagsEquipo1'],
      },
      {
        'title': 'Detection name #1',
        'address': 'Avd. de la prueba X',
        'vehicles': 16,
        'tags': ['TagsEquipo1', 'TagsEquipo1', 'TagsEquipo1'],
      },
      {
        'title': 'Detection name #1',
        'address': 'Avd. de la prueba X',
        'vehicles': 16,
        'tags': ['TagsEquipo1', 'TagsEquipo1', 'TagsEquipo1'],
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Volver
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: MainTheme.iconSettingsColor,
                onPressed: () => Navigator.pop(context),
              ),

              // Título
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 1),
                child: Text(
                  "My detections",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: MainTheme.textColorDark,
                  ),
                ),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.01, // Equivale a aproximadamente 8px en una pantalla de 800px de alto
              ),

              ///Divider con sombra
              const Divider(
                height: 5,
                indent: 15,
                endIndent: 15,
                thickness: 1,
                color: MainTheme.backgroundColorSection,
              ),
              // Búsqueda
              SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.03, // Equivale a aproximadamente 10px
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: MainTheme.secundaryColor,
                      size: 20,
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    hintText: "#Tag or name...",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: MainTheme.backgroundColorSection,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: MainTheme.backgroundColorSection,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),

              // Lista dinámica de tarjetas
              const SizedBox(height: 16), // Espacio entre buscador y tarjetas
              // Lista de tarjetas
              Expanded(
                child: ListView.builder(
                  itemCount: detections.length,
                  itemBuilder: (context, index) {
                    final detection = detections[index];

                    return DetectionCard(
                      title: detection['title'],
                      address: detection['address'],
                      vehicles: detection['vehicles'],
                      tags: List<String>.from(detection['tags']),
                      onEdit: () {
                        // Acción para editar
                      },
                      onLoad: () {
                        // Acción para cargar
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
