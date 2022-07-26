import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool? rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: rememberMe,
          activeColor: const Color(0xff5f82ff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          onChanged: (checked) {
            setState(() {
              rememberMe = checked;
            });
          },
        ),
        Text(
          'Remember Me',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
