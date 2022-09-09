import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

import 'button_ink.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final Uri uri = Uri.parse('$url');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {},
          child: ButtonInk(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(40),
            ),
            icon: IconlyBold.chat,
            text: 'Message',
            contentColor: Colors.white,
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () => _launchUrl(uri),
          child: ButtonInk(
            decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 2),
              borderRadius: BorderRadius.circular(40),
            ),
            icon: IconlyBold.discovery,
            text: 'Website',
            contentColor: primaryColor,
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      print('Could not launch $uri');
    }
  }
}
