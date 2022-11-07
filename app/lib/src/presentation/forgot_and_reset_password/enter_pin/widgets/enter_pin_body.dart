import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../account_setup/create_new_pin/widgets/pin_code_input.dart';
import '../bloc/pin_entry_bloc.dart';
import '../widgets/main_action_button.dart';
import '../widgets/resend_code_row.dart';

class EnterPinBody extends StatefulWidget {
  const EnterPinBody({
    Key? key,
    required dynamic contactInfo,
  })  : _contactInfo = contactInfo,
        super(key: key);

  final dynamic _contactInfo;

  @override
  State<EnterPinBody> createState() => _EnterPinBodyState();
}

class _EnterPinBodyState extends State<EnterPinBody> {
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinEntryBloc, PinEntryState>(
      listener: (context, state) {
        if (state is PinEntryFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is PinSendingFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
        if (state is PinEntrySuccess) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          context.router.pushNamed(Routes.createNewPassword);
        }
      },
      builder: (context, state) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05,
                  screenHeight * 0.1,
                  screenWidth * 0.05,
                  screenHeight * 0.05,
                ),
                child: Text(
                  '${AppLocalizations.of(context).pinEntryPrompt} ${widget._contactInfo}',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              PinCodeInput(controller: pinController, obscureText: false),
              ResendCodeRow(contactInfo: widget._contactInfo as String),
              MainActionButton(pin: pinController.text),
            ],
          ),
        );
      },
    );
  }
}
