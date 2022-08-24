import 'package:flutter/material.dart';

import '../../course_details/widgets/lesson_card.dart';
import '../../course_details/widgets/section_row.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SectionRow(
          title: 'Section 1',
          leadingButtonText: '15 mins',
        ),
        LessonCard(
          id: '01',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: false,
        ),
        LessonCard(
          id: '02',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: true,
        ),
        SectionRow(
          title: 'Section 2',
          leadingButtonText: '60 mins',
        ),
        LessonCard(
          id: '01',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: false,
        ),
        LessonCard(
          id: '02',
          lessonTitle: 'Why using Figma',
          duration: '10 mins',
          isLock: true,
        )
      ],
    );
  }
}
