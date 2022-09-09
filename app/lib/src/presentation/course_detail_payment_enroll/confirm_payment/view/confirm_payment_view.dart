import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../../injector/injector.dart';
import '../bloc/confirm_payment_bloc.dart';
import '../widgets/confirm_payment_body.dart';

class ConfirmPaymentView extends StatelessWidget {
  const ConfirmPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textTheme.headline6,
        title: const Text('Enroll Course'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(IconlyLight.more_circle))
        ],
        leadingWidth: 35,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: BlocProvider(
        create: (context) => getIt<ConfirmPaymentBloc>(),
        child: const ConfirmPaymentBody(),
      ),
    );
  }
}
