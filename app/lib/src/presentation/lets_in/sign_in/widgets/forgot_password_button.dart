import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      //! Push object
      onPressed: () => context.router.push(SelectContactRoute(email: email)),
      child: Text(
        AppLocalizations.of(context).forgotThePassword,
        style: Theme.of(context).textTheme.caption?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
