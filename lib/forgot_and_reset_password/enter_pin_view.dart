import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'create_new_password_view.dart';

class EnterPinView extends StatelessWidget {
  const EnterPinView({
    Key? key,
    required String contactInfo,
  })  : _contactInfo = contactInfo,
        super(key: key);

  final String _contactInfo;

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
              'Forgot Password',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.0995,
          ),
          body: ScaffoldBody(contactInfo: _contactInfo),
        ),
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    Key? key,
    required String contactInfo,
  })  : _contactInfo = contactInfo,
        super(key: key);

  final String _contactInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(children: [
        const Expanded(
          child: SizedBox(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.1,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.05),
          child: Text(
            'Code has been sent to $_contactInfo',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const PinCodeInput(),
        const ResendCodeRow(),
        const MainActionButton(),
      ]),
    );
  }
}

class ResendCodeRow extends StatelessWidget {
  const ResendCodeRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resend code in ',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            TweenAnimationBuilder(
              tween:
                  Tween(begin: const Duration(minutes: 1), end: Duration.zero),
              duration: const Duration(minutes: 1),
              builder:
                  (BuildContext context, Duration duration, Widget? child) {
                return Text(
                  '${duration.inSeconds}',
                  style: Theme.of(context).textTheme.labelMedium,
                );
              },
            ),
            Text(
              ' s',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ));
  }
}

class MainActionButton extends StatelessWidget {
  const MainActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNewPasswordView(),
            ),
          );
        },
        child: const MainActionInk(buttonString: 'Continue'),
      ),
    );
  }
}

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    Key? key,
  }) : super(key: key);

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  String pinCode = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.03,
          0, MediaQuery.of(context).size.height * 0.07),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        onChanged: onPinCodeChanged,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          borderWidth: 1,
          fieldHeight: MediaQuery.of(context).size.height * 0.07,
          fieldWidth: MediaQuery.of(context).size.width * 0.2,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey[300],
          selectedColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  void onPinCodeChanged(String value) {
    setState(() {
      pinCode = value;
    });
  }
}
