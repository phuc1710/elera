import 'package:flutter/material.dart';

class AppSnackBar {
  const AppSnackBar({
    required this.message,
  }) : super();

  final String message;

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
