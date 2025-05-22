import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detection_history_event.dart';
import 'detection_history_state.dart';

class DetectionHistoryBloc
    extends Bloc<DetectionHistoryEvent, DetectionHistoryState> {
  DetectionHistoryBloc() : super(LoadingState()) {
    // Evento: cargar detecciones
    on<LoadDetections>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 1)); // Simulamos carga

      final dummyData = ['Conteo 1', 'Conteo 2', 'Conteo 3']; // Simulado

      if (dummyData.isNotEmpty) {
        debugPrint('Detecciones cargadas: ${dummyData.length}');
        emit(LoadedState(detections: dummyData));
      } else {
        debugPrint('No hay detecciones guardadas');
        emit(EmptyState());
      }
    });

    // Evento: eliminar una detección por ID
    on<DeleteDetection>((event, emit) {
      debugPrint('Detección eliminada: ${event.detectionId}');
      // Aquí elimino o regardo la detección
      // Simulo la eliminación

      emit(LoadingState());
    });
  }
}
