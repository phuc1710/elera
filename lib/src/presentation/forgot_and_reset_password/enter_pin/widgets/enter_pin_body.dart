import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../account_setup/create_new_pin/widgets/pin_code_input.dart';
import '../../create_new_password/views/create_new_password_view.dart';
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
          Navigator.push<Object?>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => const CreateNewPasswordView(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.1,
                  MediaQuery.of(context).size.width * 0.05,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                child: Text(
                  'Code has been sent to ${widget._contactInfo}',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              PinCodeInput(
                controller: pinController,
                obscureText: true,
              ),
              ResendCodeRow(contactInfo: widget._contactInfo as String),
              MainActionButton(pin: pinController.text),
            ],
          ),
        );
      },
    );
  }
}
