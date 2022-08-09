import 'package:flutter/material.dart';

import 'button_ink.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonInk(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          icon: Icons.chat,
          text: 'Message',
          contentColor: Colors.white,
        ),
        ButtonInk(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          icon: Icons.navigation_rounded,
          text: 'Website',
          contentColor: primaryColor,
        ),
      ],
    );
  }
}
