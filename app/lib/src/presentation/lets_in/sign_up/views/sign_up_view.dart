import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/sign_up_bloc.dart';
import '../widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(''),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider(
            create: (context) => getIt<SignUpBloc>(),
            child: const SignUpBody(),
          ),
        ),
      ),
    );
  }
}
