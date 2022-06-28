import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: CircularProgressIndicator.adaptive(),
        ),
      ],
    );
  }
}
