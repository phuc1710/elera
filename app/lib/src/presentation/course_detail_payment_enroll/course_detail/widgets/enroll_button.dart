import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';

class EnrollButton extends StatelessWidget {
  const EnrollButton({Key? key, required this.action}) : super(key: key);

  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.15,
      child: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: action,
          child: const MainActionInk(buttonString: r'Enroll Course - $40'),
        ),
      ),
    );
  }
}
