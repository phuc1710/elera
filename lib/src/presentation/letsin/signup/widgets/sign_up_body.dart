import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../account_setup/fill_your_profile/views/fill_your_profile.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../letsin/widgets/divider_row_with_text.dart';
import '../../signin/views/signin_view.dart';
import '../bloc/signup_bloc.dart';
import '../widgets/bottom_prompt_row.dart';
import '../widgets/remember_me_check_box.dart';
import '../widgets/social_login_row.dart';
import 'email_input.dart';
import 'password_input.dart';
import 'title_text.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailed) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is SignUpSuccess) {
          Navigator.of(context).pushReplacement<dynamic, Function>(
            MaterialPageRoute<dynamic>(
              builder: (context) => const FillYourProfileView(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            children: [
              const TitleText(
                title: 'Create your\nAccount',
              ),
              EmailInput(controller: _emailController),
              PasswordInput(controller: _passwordController),
              const RememberMeCheckBox(),
              InkWell(
                onTap: () => onSignUpButtonTapped(context),
                child: const MainActionInk(buttonString: 'Sign up'),
              ),
              const DividerRowWithText(
                text: 'or continue with',
                padding: EdgeInsets.fromLTRB(0.0, 68.0, 0.0, 20.0),
              ),
              const SocialLoginRow(),
              const BottomPromptRow(
                promptText: 'Already have an account?',
                view: SignInView(),
                actionText: 'Sign in',
              ),
            ],
          ),
        );
      },
    );
  }

  void onSignUpButtonTapped(BuildContext context) {
    context.read<SignUpBloc>().add(
          SignUpSubmitted(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }
}
