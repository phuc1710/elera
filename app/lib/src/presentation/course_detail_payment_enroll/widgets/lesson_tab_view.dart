import 'package:flutter/material.dart';

import '../../home_and_action_menu/home/widgets/title_row.dart';
import 'lesson_card.dart';
import 'section_row.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        TitleRow(
          title: '124 Lessons',
          leadingButtonText: 'See All',
          leadingButtonCallback: () {},
        ),
        const SectionRow(
          title: 'Section 1',
          leadingButtonText: '15 mins',
        ),
        LessonCard(
          id: '01',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: false,
          textTheme: textTheme,
          primaryColor: primaryColor,
        ),
        LessonCard(
          id: '02',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: true,
          textTheme: textTheme,
          primaryColor: primaryColor,
        ),
        const SectionRow(
          title: 'Section 2',
          leadingButtonText: '60 mins',
        ),
        LessonCard(
          id: '01',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: false,
          textTheme: textTheme,
          primaryColor: primaryColor,
        ),
        LessonCard(
          id: '02',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: true,
          textTheme: textTheme,
          primaryColor: primaryColor,
        )
      ],
    );
  }
}
