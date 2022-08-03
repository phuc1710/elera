import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/pin_entry_bloc.dart';
import '../widgets/enter_pin_body.dart';

class EnterPinView extends StatelessWidget {
  const EnterPinView({
    Key? key,
    required this.contactInfo,
  }) : super(key: key);

  final dynamic contactInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Forgot Password',
              style: Theme.of(context).textTheme.headline6,
            ),
            leadingWidth: 35,
            foregroundColor: const Color(0xff212121),
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: BlocProvider<PinEntryBloc>(
            create: (context) =>
                getIt()..add(PinSendingRequested(contactInfo as String)),
            child: EnterPinBody(contactInfo: contactInfo),
          ),
        ),
      ),
    );
  }
}
