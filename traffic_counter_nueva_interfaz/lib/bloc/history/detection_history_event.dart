// En este archivo defino los eventos posibles en la pantalla de historial de conteos.
// Cada evento representa una acción del usuario o del sistema.

abstract class DetectionHistoryEvent {}

/// Cargar todos los conteos guardados
class LoadDetections extends DetectionHistoryEvent {}

/// Eliminar un conteo específico por su ID
class DeleteDetection extends DetectionHistoryEvent {
  final String detectionId;

  DeleteDetection({required this.detectionId});
}
