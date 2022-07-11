import 'package:flutter/material.dart';

import '../../../home_and_action_menu/home/views/home_view.dart';
import 'dialog_content.dart';
import 'dialog_title.dart';

Future<dynamic> showWelcomeDialog(BuildContext context) {
  return showDialog<dynamic>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil<Object?>(
          MaterialPageRoute(builder: (context) => const HomeView()),
          (route) => false,
        );
      });

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        title: const DialogTitle(),
        content: const DialogContent(),
        contentTextStyle: Theme.of(context).textTheme.displayMedium,
      );
    },
  );
}
