import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../lets_in/sign_up/widgets/remember_me_check_box.dart';
import '../bloc/password_creation_bloc.dart';
import '../widgets/main_action_button.dart';
import '../widgets/password_input.dart';
import 'show_welcome_dialog.dart';

class CreateNewPasswordBody extends StatefulWidget {
  const CreateNewPasswordBody({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordBody> createState() => _CreateNewPasswordBodyState();
}

class _CreateNewPasswordBodyState extends State<CreateNewPasswordBody> {
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordCreationBloc, PasswordCreationState>(
      listener: (context, state) {
        if (state is PasswordCreationFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is PasswordCreationFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is PasswordCreationSuccess) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          showWelcomeDialog(context);
        }
      },
      builder: (context, state) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final l10n = AppLocalizations.of(context);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
                child: SizedBox(
                  height: screenHeight * 0.32,
                  child: Image.asset('assets/images/new_password.png'),
                ),
              ),
              Text(
                l10n.createYourNewPassword,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              PasswordInput(
                hint: l10n.password,
                controller: passwordController,
              ),
              PasswordInput(
                hint: l10n.repeatPassword,
                controller: repeatPasswordController,
              ),
              const RememberMeCheckBox(),
              MainActionButton(password: passwordController.text)
            ],
          ),
        );
      },
    );
  }
}
