import 'package:elearning/widgets/main_action_ink.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
          body: const ScaffoldBody(),
        ),
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.1,
              MediaQuery.of(context).size.width * 0.05,
              MediaQuery.of(context).size.height * 0.05),
          child: Text(
            'Add a pin number to make your account more secure',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const PinCodeInput(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: InkWell(
              onTap: () {},
              child: const MainActionInk(buttonString: 'Continue')),
        )
      ]),
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
      padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05,
          0, MediaQuery.of(context).size.height * 0.1),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        onChanged: onPinCodeChanged,
        obscureText: true,
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
