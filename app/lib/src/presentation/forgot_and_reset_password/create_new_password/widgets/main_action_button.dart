import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/main_action_ink.dart';
import '../bloc/password_creation_bloc.dart';

class MainActionButton extends StatelessWidget {
  const MainActionButton({Key? key, required this.password}) : super(key: key);
  final String password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.016,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () => onContinueButtonTapped(context),
        child: MainActionInk(buttonString: AppLocalizations.of(context).cont),
      ),
    );
  }

  void onContinueButtonTapped(BuildContext context) {
    context
        .read<PasswordCreationBloc>()
        .add(PasswordCreationSubmitted(password));
  }
}
