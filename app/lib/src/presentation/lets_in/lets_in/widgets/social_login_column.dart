import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import 'social_login_ink.dart';

class SocialLoginColumn extends StatelessWidget {
  const SocialLoginColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              // TODO(phucndh): Navigate to Facebook login
            },
            child: SocialLoginInk(
              iconPath: 'assets/images/facebook_logo.png',
              text: l10n.continueWithFacebook,
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
            child: SocialLoginInk(
              iconPath: 'assets/images/google-logo.png',
              text: l10n.continueWithGoogle,
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
            child: SocialLoginInk(
              iconPath: 'assets/images/apple-logo.png',
              text: l10n.continueWithApple,
            ),
          ),
        ),
      ],
    );
  }
}
