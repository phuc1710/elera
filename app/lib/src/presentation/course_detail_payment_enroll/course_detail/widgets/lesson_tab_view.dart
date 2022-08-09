import 'package:flutter/material.dart';

import '../../../home_and_action_menu/home/widgets/title_row.dart';
import 'lesson_card.dart';
import 'section_row.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
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
          const LessonCard(
            id: '01',
            lessonTitle: 'Why using Figma',
            duration: '10 mins',
            isLock: false,
          ),
          const LessonCard(
            id: '02',
            lessonTitle: 'Why using Figma',
            duration: '10 mins',
            isLock: true,
          ),
          const SectionRow(
            title: 'Section 2',
            leadingButtonText: '60 mins',
          ),
          const LessonCard(
            id: '01',
            lessonTitle: 'Why using Figma',
            duration: '10 mins',
            isLock: false,
          ),
          const LessonCard(
            id: '02',
            lessonTitle: 'Why using Figma',
            duration: '10 mins',
            isLock: true,
          )
        ],
      ),
    );
  }
}
