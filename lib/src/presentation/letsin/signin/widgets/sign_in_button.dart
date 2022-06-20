import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key, required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const MainActionInk(buttonString: 'Sign in'),
    );
  }
}
