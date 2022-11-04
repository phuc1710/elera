import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

class DialogTitle extends StatelessWidget {
  const DialogTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          child: Image.asset('assets/images/welcome_dialog.png'),
        ),
        Text(
          AppLocalizations.of(context).enrollCourseSuccessful,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
