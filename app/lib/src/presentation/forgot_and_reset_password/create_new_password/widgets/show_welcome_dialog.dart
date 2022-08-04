import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../config/router/app_router.dart';
import 'dialog_content.dart';
import 'dialog_title.dart';

Future<dynamic> showWelcomeDialog(BuildContext context) async {
  showDialog<dynamic>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
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
  await Future.delayed(const Duration(seconds: 2), () {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.router
          .pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
    });
  });
}
