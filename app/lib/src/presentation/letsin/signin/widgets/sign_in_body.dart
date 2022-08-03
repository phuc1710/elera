import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../letsin/widgets/divider_row_with_text.dart';
import '../../signup/widgets/bottom_prompt_row.dart';
import '../../signup/widgets/email_input.dart';
import '../../signup/widgets/password_input.dart';
import '../../signup/widgets/remember_me_check_box.dart';
import '../../signup/widgets/social_login_row.dart';
import '../../signup/widgets/title_text.dart';
import '../bloc/signin_bloc.dart';
import 'forgot_password_button.dart';
import 'sign_in_button.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInFailed) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is SignInSuccess) {
          context.router.navigateNamed(Routes.homeRoute);
        }
      },
      buildWhen: (prev, curr) => curr is! SignInLoading,
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
            onTap: () => onSignInButtonTapped(context),
          ),
          ForgotPasswordButton(email: _emailController.text),
          const DividerRowWithText(
            text: 'or continue with',
            padding: EdgeInsets.symmetric(vertical: 20.0),
          ),
          const SocialLoginRow(),
          const BottomPromptRow(
            promptText: "Don't have an account?",
            path: Routes.signUpRoute,
            actionText: 'Sign up',
          )
        ],
      ),
    );
  }

  void onSignInButtonTapped(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<SignInBloc>().add(
          SignInSubmitted(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }
}
