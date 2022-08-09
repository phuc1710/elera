import 'package:flutter/material.dart';

class MentorInfoColumn extends StatelessWidget {
  const MentorInfoColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: primaryColor,
          radius: screenHeight * 0.08,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Jonathan Williams', style: textTheme.headline6),
        ),
        Text('Senior UI/UX Designer at Gooogle', style: textTheme.caption),
      ],
    );
  }
}
