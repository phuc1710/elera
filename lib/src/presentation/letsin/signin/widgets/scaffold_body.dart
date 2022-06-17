import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../letsin/widgets/divider_row_with_text.dart';
import '../../signup/views/signup_view.dart';
import '../../signup/widgets/bottom_prompt_row.dart';
import '../../signup/widgets/password_input.dart';
import '../../signup/widgets/remember_me_check_box.dart';
import '../../signup/widgets/social_login_row.dart';
import '../../signup/widgets/title_text.dart';
import '../../signup/widgets/username_input.dart';
import 'forgot_password_button.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: [
          const TitleText(title: 'Login to your\nAccount'),
          const UsernameInput(),
          const PasswordInput(),
          const RememberMeCheckBox(),
          InkWell(
            onTap: () {},
            child: const MainActionInk(buttonString: 'Sign in'),
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
