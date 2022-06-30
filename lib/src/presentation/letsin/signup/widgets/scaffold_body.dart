import 'package:flutter/material.dart';

import '../../../account_setup/fill_your_profile/views/fill_your_profile.dart';
import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../letsin/widgets/divider_row_with_text.dart';
import '../../signin/views/signin_view.dart';
import '../widgets/bottom_prompt_row.dart';
import '../widgets/remember_me_check_box.dart';
import '../widgets/social_login_row.dart';
import 'email_input.dart';
import 'password_input.dart';
import 'title_text.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

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
            onTap: () {
              Navigator.of(context).pushReplacement<dynamic, Function>(
                MaterialPageRoute<dynamic>(
                  builder: (context) => const FillYourProfileView(),
                ),
              );
            },
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
  }
}
