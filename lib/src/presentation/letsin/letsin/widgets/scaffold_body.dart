import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import '../../signin/views/signin_view.dart';
import 'bottom_prompt_row.dart';
import 'divider_row_with_text.dart';
import 'social_login_column.dart';

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Image.asset('assets/images/login.png'),
            ),
            Text(
              "Let's you in",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SocialLoginColumn(),
            const DividerRowWithText(
              text: 'or',
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            InkWell(
              onTap: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => const SignInView(),
                  ),
                );
              },
              child: const MainActionInk(
                buttonString: 'Sign in with password',
              ),
            ),
            const BottomPromptRow()
          ],
        ),
      ),
    );
  }
}
