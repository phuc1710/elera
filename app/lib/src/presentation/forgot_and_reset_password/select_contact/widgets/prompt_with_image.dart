import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

class PromptWithImage extends StatelessWidget {
  const PromptWithImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.3,
          child: Image.asset('assets/images/contact.png'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
          child: Text(
            AppLocalizations.of(context).selectContactDescription,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
