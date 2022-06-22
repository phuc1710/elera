import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/snackbar.dart';
import '../../../home_and_action_menu/home/views/home_view.dart';
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
          AppSnackBar(message: state.message ?? 'An error occurred')
              .show(context);
        }
        if (state is SignInSuccess) {
          Navigator.pushAndRemoveUntil<Object?>(
            context,
            MaterialPageRoute<dynamic>(builder: (context) => const HomeView()),
            (dynamic route) => false,
          );
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

  void onSignInButtonTapped(BuildContext context) {
    context.read<SignInBloc>().add(
          SignInSubmitted(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }
}
