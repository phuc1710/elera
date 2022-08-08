import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../letsin/signup/widgets/remember_me_check_box.dart';
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
                'Create Your New Password',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              PasswordInput(
                hint: 'Password',
                controller: passwordController,
              ),
              PasswordInput(
                hint: 'Repeat Password',
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
