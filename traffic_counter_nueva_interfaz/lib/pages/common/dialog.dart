import 'package:flutter/material.dart';

Future<dynamic> logInShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF2F2E75), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sign in Required',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF2F2E75),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'To be able to see your profile or load a detection you must log in with Google.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF2F2E75),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pop(); // Cierra el diálogo

                // Redirige a MyDetectionsPage después del login
                Navigator.pushReplacementNamed(context, '/detection_history');
              },
              child: Image.asset('assets/images/SignInGoogle.png', height: 40),
            ),
          ],
        ),
      );
    },
  );
}
