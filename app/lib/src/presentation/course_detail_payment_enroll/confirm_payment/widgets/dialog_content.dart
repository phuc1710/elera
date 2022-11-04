import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../widgets/main_action_ink.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l10n.enrollSuccessDialogContent, textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  int count = 0;
                  context.router.popUntil((route) => count++ == 3);
                },
                child: MainActionInk(
                  buttonString: l10n.viewCourse,
                  disableShadow: true,
                ),
              ),
              const SizedBox.square(dimension: 20),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {},
                child: MainActionInk(
                  buttonString: l10n.viewEReceipt,
                  isNotMainAction: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
