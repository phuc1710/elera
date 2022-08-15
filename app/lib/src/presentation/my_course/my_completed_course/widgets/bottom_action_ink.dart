import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';

class BottomActionInk extends StatelessWidget {
  const BottomActionInk({
    Key? key,
    required this.buttonString,
    required this.action,
  }) : super(key: key);

  final String buttonString;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: Material(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: action,
            child: MainActionInk(buttonString: buttonString),
          ),
        ),
      ),
    );
  }
}
