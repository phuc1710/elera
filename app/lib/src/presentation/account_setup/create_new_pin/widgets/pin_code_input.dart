import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    Key? key,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  String pinCode = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding:
          EdgeInsets.fromLTRB(0, screenHeight * 0.05, 0, screenHeight * 0.1),
      child: PinCodeTextField(
        appContext: context,
        controller: widget.controller,
        length: 4,
        onChanged: onPinCodeChanged,
        obscureText: widget.obscureText,
        keyboardType: TextInputType.number,
        textStyle: Theme.of(context).textTheme.headline6,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          borderWidth: 1,
          fieldHeight: screenHeight * 0.07,
          fieldWidth: screenWidth * 0.2,
          activeColor: Theme.of(context).colorScheme.primary,
          activeFillColor: const Color(0xffeff3ff),
          inactiveColor: const Color(0xffeeeeee),
          inactiveFillColor: const Color(0xfffafafa),
          selectedColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  void onPinCodeChanged(String value) {
    setState(() => pinCode = value);
  }
}
