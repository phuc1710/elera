import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import 'dialog_content.dart';
import 'dialog_title.dart';

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              showWelcomeDialog(context);
            },
            child: const MainActionInk(
              buttonString: 'Skip',
              width: 0.4,
              isMainAction: true,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              showWelcomeDialog(context);
            },
            child: const MainActionInk(
              buttonString: 'Continue',
              width: 0.4,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showWelcomeDialog(BuildContext context) {
    return showDialog<dynamic>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        // Future.delayed(const Duration(seconds: 2), () {
        //   Navigator.of(context).pop();
        //   Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(builder: (context) => const Onboarding()),
        //       (route) => false);
        // });
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
}
