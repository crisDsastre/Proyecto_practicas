import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/bloc/camera_view_bloc.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/bloc/camera_view_event.dart';
import 'package:traffic_counter_nueva_interfaz/pages/camera_view/bloc/camera_view_state.dart';

class NewDetectionPage extends StatelessWidget {
  const NewDetectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //Envuelvo toda la página en un BlocProvider para que el Bloc esté disponible en toda la página
    // y pueda ser accedido por los widgets que lo necesiten.
    return BlocProvider(
      create: (context) => CameraViewBloc(), // Creo el Bloc paara la página
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 65),
            child: Column(
              children: [
                DetectionImage(size: size), // imagen superior
                const DetectionActionButtons(), // History - Clear - Curve
                DetectionBottomControls(), // Settings - Play - Save - Delete
              ],
            ),
          ),
        ),
      ),
    );
  }
}
