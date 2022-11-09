import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../injector/injector.dart';
import '../bloc/password_creation_bloc.dart';
import '../widgets/create_new_password_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).createNewPassword,
              style: Theme.of(context).textTheme.headline6,
            ),
            leadingWidth: 35,
            foregroundColor: const Color(0xff212121),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(IconlyLight.arrow_left),
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider(
            create: (context) => getIt<PasswordCreationBloc>(),
            child: const CreateNewPasswordBody(),
          ),
        ),
      ),
    );
  }
}
