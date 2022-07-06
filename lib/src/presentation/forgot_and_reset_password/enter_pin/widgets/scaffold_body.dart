import 'package:flutter/material.dart';

import '../../../account_setup/create_new_pin/widgets/pin_code_input.dart';
import '../widgets/main_action_button.dart';
import '../widgets/resend_code_row.dart';

class ScaffoldBody extends StatefulWidget {
  const ScaffoldBody({
    Key? key,
    required dynamic contactInfo,
  })  : _contactInfo = contactInfo,
        super(key: key);

  final dynamic _contactInfo;

  @override
  State<ScaffoldBody> createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          const ResendCodeRow(),
          const MainActionButton(),
        ],
      ),
    );
  }
}
