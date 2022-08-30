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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              // TODO(phucndh): Navigate to Facebook login
            },
            child: const SocialLoginInk(
              iconPath: 'assets/images/facebook_logo.png',
              text: 'Continue with Facebook',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              // TODO(phucndh): Navigate to Google login
            },
            child: const SocialLoginInk(
              iconPath: 'assets/images/google-logo.png',
              text: 'Continue with Google',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              // TODO(phucndh): Navigate to Apple login
            },
            child: const SocialLoginInk(
              iconPath: 'assets/images/apple-logo.png',
              text: 'Continue with Apple',
            ),
          ),
        ),
      ],
    );
  }
}
