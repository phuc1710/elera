import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: const MainActionInk(buttonString: 'Continue'),
    );
  }
}
