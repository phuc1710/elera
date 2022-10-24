import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';

class BottomPromptRow extends StatelessWidget {
  const BottomPromptRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.dontHaveAnAccount,
          style: Theme.of(context).textTheme.caption?.copyWith(
                color: const Color(0xff9e9e9e),
              ),
        ),
        TextButton(
          onPressed: () => context.router.pushNamed(Routes.signUp),
          child: Text(
            l10n.signUp,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
