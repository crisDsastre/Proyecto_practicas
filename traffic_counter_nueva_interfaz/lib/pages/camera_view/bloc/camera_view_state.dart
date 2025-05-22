// Este archivo define todos los "estados" posibles que puede tener la pantalla camera_view.
// El estado describe cómo está la pantalla en un momento determinado.
// La UI se actualiza cada vez que cambia el estado.

import 'package:flutter/material.dart';

/// Clase base de todos los estados necesario para que funcionen los tipos en Bloc
abstract class CameraViewState {}

/// Estado inicial: todavía no se ha empezado a contar
class InitialState extends CameraViewState {}

/// Estado mientras el usuario está contando vehículos
/// Este estado tiene un parámetro: el conteo actual de vehículos
/// que se va actualizando a medida que el usuario cuenta.
class CountingState extends CameraViewState {
  final int vehicleCount;

  CountingState({required this.vehicleCount});
}

/// Estado cuando el usuario detiene el conteo
class StoppedState extends CameraViewState {
  final int finalCount;

  StoppedState({required this.finalCount});
}

/// Estado cuando se ha guardado el conteo exitosamente
class SavedState extends CameraViewState {}

/// Estado mientras el usuario está dibujando una línea o curva
class DrawingState extends CameraViewState {
  final bool isCurve; // true = curva, false = línea recta

  DrawingState({required this.isCurve});
}

/// Estado cuando el dibujo ha terminado y se ha guardado
class LineDefinedState extends CameraViewState {
  final List<Offset> drawnPoints;

  LineDefinedState({required this.drawnPoints});
}
