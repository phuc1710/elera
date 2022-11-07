import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context).welcomeDialogContent,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }
}
