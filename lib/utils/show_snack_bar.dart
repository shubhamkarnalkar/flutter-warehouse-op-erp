import 'package:flutter/material.dart';

void showSnackBarMessage(
    {required BuildContext context, String? error, String? message}) {
  if (error != null) {
    message = error;
  }
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message ?? ''),
        backgroundColor: error == null ? null : Colors.red,
      ),
    );
}
