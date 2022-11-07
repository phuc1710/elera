import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../injector/injector.dart';
import '../bloc/sign_in_bloc.dart';
import '../widgets/sign_in_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(''),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(IconlyLight.arrow_left),
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider(
            create: (context) => getIt<SignInBloc>(),
            child: const SignInBody(),
          ),
        ),
      ),
    );
  }
}
