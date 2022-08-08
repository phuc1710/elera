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
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.5,
          ),
          value: rememberMe,
          activeColor: Theme.of(context).colorScheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          onChanged: (checked) => setState(() => rememberMe = checked),
        ),
        GestureDetector(
          onTap: () => setState(() => rememberMe = rememberMe == false),
          child: Text(
            'Remember Me',
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
