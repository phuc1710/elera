import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    Key? key,
    required this.obscureText,
  }) : super(key: key);

  final bool obscureText;

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  String pinCode = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        MediaQuery.of(context).size.height * 0.05,
        0,
        MediaQuery.of(context).size.height * 0.1,
      ),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        onChanged: onPinCodeChanged,
        obscureText: widget.obscureText,
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
