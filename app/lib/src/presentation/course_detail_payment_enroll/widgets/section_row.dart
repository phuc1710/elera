import 'package:flutter/material.dart';

import 'lesson_section_text.dart';

class SectionRow extends StatelessWidget {
  const SectionRow({
    Key? key,
    required this.title,
    required this.leadingButtonText,
  }) : super(key: key);

  final String title;
  final String leadingButtonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LessonSectionText(text: title),
          Text(
            leadingButtonText,
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
