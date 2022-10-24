import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/app_router.dart';
import '../../../../config/router/routes.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../lets_in/widgets/divider_row_with_text.dart';
import '../../sign_up/widgets/bottom_prompt_row.dart';
import '../../sign_up/widgets/email_input.dart';
import '../../sign_up/widgets/password_input.dart';
import '../../sign_up/widgets/remember_me_check_box.dart';
import '../../sign_up/widgets/social_login_row.dart';
import '../../sign_up/widgets/title_text.dart';
import '../bloc/sign_in_bloc.dart';
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
        if (state is SignInFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is SignInSuccess) {
          context.router
              .pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }
      },
      buildWhen: (prev, current) =>
          prev is SignInInitial || prev is SignInLoading,
      builder: (context, state) {
        return (state is SignInLoading)
            ? const LoadingWidget()
            : buildLoginView(context);
      },
    );
  }

  Padding buildLoginView(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: ListView(
        children: [
          TitleText(title: l10n.loginToYourAccount),
          EmailInput(controller: _emailController),
          PasswordInput(controller: _passwordController),
          const RememberMeCheckBox(),
          SignInButton(
            onTap: () => onSignInButtonTapped(context),
          ),
          ForgotPasswordButton(email: _emailController.text),
          DividerRowWithText(
            text: l10n.orContinueWith,
            padding: const EdgeInsets.symmetric(vertical: 20.0),
          ),
          const SocialLoginRow(),
          BottomPromptRow(
            promptText: l10n.dontHaveAnAccount,
            path: Routes.signUp,
            actionText: l10n.signUp,
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
