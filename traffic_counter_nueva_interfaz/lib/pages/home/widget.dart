import 'package:flutter/material.dart';
import 'package:traffic_counter_nueva_interfaz/constants/main_theme.dart'; // Tu archivo de colores y estilos
import 'package:traffic_counter_nueva_interfaz/pages/common/dialog.dart'; // Donde está el logInShowDialog

/// Este botón lanza una nueva detección (todavía sin definir su acción)
class NewDetectionButton extends StatelessWidget {
  const NewDetectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, '/camera_view'),

      // Aquí definiré la función que se ejecuta al presionar el botón.
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        backgroundColor:
            MainTheme.backgroundColorSection, // Color de fondo desde tu tema
        elevation: 7, // Altura de la sombra
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13), // Bordes redondeados
        ),
      ),
      child: Text(
        'New detection',
        style:
            Theme.of(
              context,
            ).textTheme.labelMedium, // Estilo de texto desde el tema
      ),
    );
  }
}

/// Este botón abre un diálogo para iniciar sesión (con Google)
class LoadDetectionButton extends StatelessWidget {
  const LoadDetectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => logInShowDialog(context),

      // Llama a la función que abre el AlertDialog
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        backgroundColor:
            MainTheme.backgroundColorSectionLight, // Color más claro
        elevation: 7,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
          side: BorderSide(
            color:
                MainTheme.backgroundColorSection, // Borde con color principal
            width: 1,
          ),
        ),
      ),
      child: Text(
        'Load detection',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: MainTheme.textColorDark,
        ), // Color del texto
      ),
    );
  }
}
