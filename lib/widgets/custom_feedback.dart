import 'package:flutter/material.dart';

/// Clase dedicada a personalizar el feedback que se le mostrara al usuario
class CustomFeedback {
  /// Feedback de Snackbar de error, con su estilo por defecto
  static void showErrSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          Text(message),
        ],
      ),
      backgroundColor: Colors.red,
    ));
  }

  /// Feedback dedicada a la alerta, con su estilo por defecto
  static void showAlert(String title, String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'roboto',
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              message,
              style: const TextStyle(
                fontFamily: 'roboto',
              ),
              textAlign: TextAlign.justify,
            ),
            contentPadding: const EdgeInsets.all(8),
          );
        });
  }
}
