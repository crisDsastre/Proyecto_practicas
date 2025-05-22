// Este archivo define todos los "eventos" posibles que pueden pasar en la pantalla camera_view.
// Un evento representa una acción del usuario o del sistema.

import 'package:flutter/material.dart';

abstract class CameraViewEvent {}

// El usuario presiona "Iniciar Conteo"
class StartCounting extends CameraViewEvent {}

// El usuario presiona para contar un vehículo más cuando cruza la línea
// Este evento tiene un parámetro: el tipo de vehículo (auto, bus, camión, etc.)
class IncrementVehicle extends CameraViewEvent {}

// El usuario detiene el conteo (por ejemplo, presiona "Stop")
class StopCounting extends CameraViewEvent {}

// El usuario guarda el resultado del conteo
class SaveCount extends CameraViewEvent {}

// El usuario activa el modo de dibujo (línea recta o curva)
// Este evento tiene un parámetro: isCurve → true = curva, false = línea recta
class EnableDrawing extends CameraViewEvent {
  final bool isCurve;

  EnableDrawing({required this.isCurve});
}

// El usuario termina de dibujar la línea o curva
// Este evento tiene un parámetro: una lista de puntos (coordenadas del dibujo)
class FinishDrawing extends CameraViewEvent {
  final List<Offset> points;

  FinishDrawing({required this.points});
}

// El usuario quiere borrar la línea que había dibujado
class ClearDrawing extends CameraViewEvent {}
