import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../config/router/app_router.dart';
import '../../../widgets/main_action_ink.dart';
import 'dialog_content.dart';
import 'dialog_title.dart';

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () => showWelcomeDialog(context),
            child: MainActionInk(
              buttonString: l10n.skip,
              width: 0.4,
              isNotMainAction: true,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () => showWelcomeDialog(context),
            child: MainActionInk(buttonString: l10n.cont, width: 0.4),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showWelcomeDialog(BuildContext context) async {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          title: const DialogTitle(),
          content: const DialogContent(),
          contentTextStyle:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
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
}
