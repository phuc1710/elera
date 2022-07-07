import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/create_new_pin_bloc.dart';
import '../widgets/create_new_pin_body.dart';

class CreateNewPinView extends StatelessWidget {
  const CreateNewPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Create new PIN',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider<CreateNewPinBloc>(
            create: (context) => injector<CreateNewPinBloc>(),
            child: const CreateNewPinBody(),
          ),
        ),
      ),
    );
  }
}
