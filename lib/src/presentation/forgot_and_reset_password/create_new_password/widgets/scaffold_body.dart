import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../letsin/signup/widgets/remember_me_check_box.dart';
import '../bloc/password_creation_bloc.dart';
import '../widgets/main_action_button.dart';
import '../widgets/password_input.dart';
import 'show_welcome_dialog.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
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
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: Image.asset('assets/images/new_password.png'),
                ),
              ),
              Text(
                'Create Your New Password',
                style: Theme.of(context).textTheme.displayMedium,
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
