import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../onboarding/intro/widgets/main_action_ink.dart';
import 'bottom_prompt_row.dart';
import 'divider_row_with_text.dart';
import 'social_login_column.dart';

class LetsInBody extends StatelessWidget {
  const LetsInBody({
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
              onTap: () => context.router.pushNamed('/sign_in'),
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
