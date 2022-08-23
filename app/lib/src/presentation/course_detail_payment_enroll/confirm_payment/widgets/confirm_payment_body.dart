import 'package:flutter/material.dart';

import '../../../account_setup/create_new_pin/widgets/pin_code_input.dart';
import '../../../widgets/main_action_ink.dart';
import 'dialog_content.dart';
import 'dialog_title.dart';

class ConfirmPaymentBody extends StatefulWidget {
  const ConfirmPaymentBody({Key? key}) : super(key: key);

  @override
  State<ConfirmPaymentBody> createState() => _ConfirmPaymentBodyState();
}

class _ConfirmPaymentBodyState extends State<ConfirmPaymentBody> {
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              'Enter your PIN to confirm payment',
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
          PinCodeInput(
            controller: pinController,
            obscureText: true,
          ),
          const Expanded(flex: 2, child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.032),
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              onTap: () => onContinueButtonTapped(context),
              child: const MainActionInk(buttonString: 'Continue'),
            ),
          )
        ],
      ),
    );
  }

  void onContinueButtonTapped(BuildContext context) {
    showSuccessfulDialog(context);
  }

  void showSuccessfulDialog(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          title: const DialogTitle(),
          content: const DialogContent(),
          contentTextStyle:
              Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 14),
        );
      },
    );
  }
}
