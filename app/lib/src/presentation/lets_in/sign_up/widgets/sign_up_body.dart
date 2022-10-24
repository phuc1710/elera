import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../widgets/main_action_ink.dart';
import '../../lets_in/widgets/divider_row_with_text.dart';
import '../bloc/sign_up_bloc.dart';
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
          context.router.pushNamed(Routes.fillYourProfile);
        }
      },
      builder: (context, state) {
        final l10n = AppLocalizations.of(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            children: [
              TitleText(title: l10n.createYourAccount),
              EmailInput(controller: _emailController),
              PasswordInput(controller: _passwordController),
              const RememberMeCheckBox(),
              InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () => onSignUpButtonTapped(context),
                child: MainActionInk(buttonString: l10n.signUp),
              ),
              DividerRowWithText(
                text: l10n.orContinueWith,
                padding: const EdgeInsets.fromLTRB(0.0, 68.0, 0.0, 20.0),
              ),
              const SocialLoginRow(),
              BottomPromptRow(
                promptText: l10n.alreadyHaveAnAccount,
                path: Routes.signIn,
                actionText: l10n.signIn,
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
