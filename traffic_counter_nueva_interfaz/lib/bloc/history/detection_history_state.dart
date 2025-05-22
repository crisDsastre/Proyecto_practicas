// En este archivo defino los posibles estados de la pantalla de historial de conteos.
// Cada estado representa una situación en la que se encuentra la pantalla.

abstract class DetectionHistoryState {}

/// Estado inicial mientras se cargan los datos
class LoadingState extends DetectionHistoryState {}

/// Estado cuando ya se cargaron los conteos
class LoadedState extends DetectionHistoryState {
  final List<String> detections; // Simulación: lista de nombres o IDs

  LoadedState({required this.detections});
}

/// Estado cuando no hay ningún conteo guardado
class EmptyState extends DetectionHistoryState {}

/// Estado cuando hubo un error al cargar
class ErrorState extends DetectionHistoryState {
  final String message;

  ErrorState({required this.message});
}
