import 'package:flutter/material.dart';

import '../../onboarding/intro/widgets/main_action_ink.dart';

class EnrollButton extends StatelessWidget {
  const EnrollButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.15,
      child: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: const MainActionInk(buttonString: r'Enroll Course - $40'),
        ),
      ),
    );
  }
}
