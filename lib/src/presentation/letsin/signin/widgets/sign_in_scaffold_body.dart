import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

import '../../letsin/widgets/divider_row_with_text.dart';
import '../../signup/views/signup_view.dart';
import '../../signup/widgets/bottom_prompt_row.dart';
import '../../signup/widgets/email_input.dart';
import '../../signup/widgets/remember_me_check_box.dart';
import '../../signup/widgets/password_input.dart';
import '../../signup/widgets/social_login_row.dart';
import '../../signup/widgets/title_text.dart';
import '../bloc/signin_bloc.dart';
import 'forgot_password_button.dart';
import 'sign_in_button.dart';

class SignInScaffoldBody extends StatefulWidget {
  const SignInScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScaffoldBody> createState() => _SignInScaffoldBodyState();
}

class _SignInScaffoldBodyState extends State<SignInScaffoldBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.message ?? 'An error occurred',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          );
        }
        if (state is SignInSuccess) {
          // TODO(phucndh): Navigate to the home screen
          log('Login success');
        }
      },
      builder: (context, state) {
        return buildLoginView(context);
      },
    );
  }

  Padding buildLoginView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: [
          const TitleText(title: 'Login to your\nAccount'),
          EmailInput(controller: _emailController),
          PasswordInput(controller: _passwordController),
          const RememberMeCheckBox(),
          SignInButton(
            email: _emailController.text,
            password: _passwordController.text,
            parrentContext: context,
          ),
          const ForgotPasswordButton(),
          const DividerRowWithText(
            text: 'or continue with',
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          const SocialLoginRow(),
          const BottomPromptRow(
            promptText: "Don't have an account?",
            view: SignUpView(),
            actionText: 'Sign up',
          )
        ],
      ),
    );
  }
}
