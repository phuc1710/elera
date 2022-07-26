import 'package:flutter/material.dart';

import 'social_login_ink.dart';

class SocialLoginColumn extends StatelessWidget {
  const SocialLoginColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // TODO(phucndh): Navigate to Facebook login
          },
          child: const SocialLoginInk(
            iconPath: 'assets/images/facebook-logo.png',
            text: 'Continue with Facebook',
          ),
        ),
        InkWell(
          onTap: () {
            // TODO(phucndh): Navigate to Google login
          },
          child: const SocialLoginInk(
            iconPath: 'assets/images/google-logo.png',
            text: 'Continue with Google',
          ),
        ),
        InkWell(
          onTap: () {
            // TODO(phucndh): Navigate to Apple login
          },
          child: const SocialLoginInk(
            iconPath: 'assets/images/apple-logo.png',
            text: 'Continue with Apple',
          ),
        ),
      ],
    );
  }
}
