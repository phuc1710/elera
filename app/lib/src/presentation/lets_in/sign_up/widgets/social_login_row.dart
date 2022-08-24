import 'package:flutter/material.dart';

import 'social_connect_ink.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {
              // TODO(phucndh): Facebook login
            },
            child: const SocialConnectInk(
              imagePath: 'assets/images/facebook-logo.png',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {
              // TODO(phucndh): Google login
            },
            child: const SocialConnectInk(
              imagePath: 'assets/images/google-logo.png',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: () {
              // TODO(phucndh): Apple login
            },
            child: const SocialConnectInk(
              imagePath: 'assets/images/apple-logo.png',
            ),
          ),
        ),
      ],
    );
  }
}
