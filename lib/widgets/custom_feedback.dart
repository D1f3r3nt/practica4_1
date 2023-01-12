import 'package:flutter/material.dart';

class CustomFeedback {
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
