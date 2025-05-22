// Aquí conecto los eventos con los estados.
// Cada vez que ocurre un evento, se calcula y emite un nuevo estado.
// Uso print() para ver los cambios en la consola.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'camera_view_event.dart';
import 'camera_view_state.dart';

class CameraViewBloc extends Bloc<CameraViewEvent, CameraViewState> {
  int _counter = 0; // Guarda la cantidad de vehículos contados

  CameraViewBloc() : super(InitialState()) {
    // Evento: el usuario inicia el conteo
    on<StartCounting>((event, emit) {
      _counter = 0;
      debugPrint("Conteo iniciado");
      emit(CountingState(vehicleCount: _counter));
    });

    // Evento: se detecta un vehículo
    on<IncrementVehicle>((event, emit) {
      if (state is CountingState) {
        final current = (state as CountingState).vehicleCount;
        _counter = current + 1;
        emit(CountingState(vehicleCount: _counter));
        debugPrint("Vehículo contado. Total: $_counter");
      } else if (state is InitialState) {
        debugPrint("No se ha iniciado el conteo todavía");
      } else {
        debugPrint("Estado inválido para contar vehículos");
      }
    });

    // Evento: el usuario detiene el conteo
    on<StopCounting>((event, emit) {
      if (state is CountingState) {
        debugPrint("Conteo detenido en $_counter vehículos");
        emit(StoppedState(finalCount: _counter));
      } else {
        debugPrint("No se puede detener si no se está contando");
      }
    });

    // Evento: el usuario guarda el conteo
    on<SaveCount>((event, emit) {
      if (state is StoppedState) {
        debugPrint("Conteo guardado con $_counter vehículos");
        emit(SavedState());
      } else if (state is InitialState) {
        debugPrint("No se puede guardar: no hay conteo iniciado");
      } else {
        debugPrint("Solo puedes guardar después de detener el conteo");
      }
    });

    // Evento: el usuario activa el modo dibujo (línea recta o curva)
    on<EnableDrawing>((event, emit) {
      if (state is CountingState) {
        debugPrint(
          "Modo dibujo activado (${event.isCurve ? 'Curva' : 'Línea recta'})",
        );
        emit(DrawingState(isCurve: event.isCurve));
      } else {
        debugPrint("Activa el conteo antes de dibujar la línea");
      }
    });

    // Evento: el usuario termina de dibujar la línea
    on<FinishDrawing>((event, emit) {
      if (state is DrawingState) {
        debugPrint("Dibujo finalizado con ${event.points.length} puntos");
        emit(LineDefinedState(drawnPoints: event.points));
      } else {
        debugPrint("No estás en modo dibujo");
      }
    });

    // Evento: se borra la línea dibujada
    on<ClearDrawing>((event, emit) {
      if (state is LineDefinedState || state is DrawingState) {
        debugPrint("Dibujo eliminado");
        emit(InitialState());
      } else {
        debugPrint("No hay dibujo que borrar");
      }
    });
  }
}
// Aquí se definen los eventos y estados que se usan en el Bloc.