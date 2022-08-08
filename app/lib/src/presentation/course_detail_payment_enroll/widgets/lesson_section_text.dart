import 'package:flutter/material.dart';

class LessonSectionText extends StatelessWidget {
  const LessonSectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.bodyText2?.copyWith(
        fontWeight: FontWeight.bold,
        color: const Color(0xff616161),
      ),
    );
  }
}
