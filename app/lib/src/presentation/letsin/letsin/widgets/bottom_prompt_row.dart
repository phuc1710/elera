import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';

class BottomPromptRow extends StatelessWidget {
  const BottomPromptRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: const Color(0xff9e9e9e)),
        ),
        TextButton(
          onPressed: () => context.router.pushNamed(Routes.signUpRoute),
          child: Text(
            'Sign up',
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
