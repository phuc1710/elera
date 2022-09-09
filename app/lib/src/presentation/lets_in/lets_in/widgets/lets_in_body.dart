import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';
import '../../../widgets/main_action_ink.dart';
import 'bottom_prompt_row.dart';
import 'divider_row_with_text.dart';
import 'social_login_column.dart';

class LetsInBody extends StatelessWidget {
  const LetsInBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              child: Image.asset('assets/images/login.png'),
            ),
            Text(
              "Let's you in",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SocialLoginColumn(),
            DividerRowWithText(
              text: 'or',
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () => context.router.pushNamed(Routes.signIn),
              child: const MainActionInk(buttonString: 'Sign in with password'),
            ),
            const BottomPromptRow()
          ],
        ),
      ),
    );
  }
}
