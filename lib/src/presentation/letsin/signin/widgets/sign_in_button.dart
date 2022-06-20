import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../bloc/signin_bloc.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
    required this.email,
    required this.password,
    required this.parrentContext,
  }) : super(key: key);

  final String email;
  final String password;
  final BuildContext parrentContext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        parrentContext
            .read<SignInBloc>()
            .add(SignInSubmitted(email: email, password: password));
      },
      child: const MainActionInk(buttonString: 'Sign in'),
    );
  }
}
