import 'package:flutter/material.dart';

import '../../../course_detail_payment_enroll/course_detail/widgets/lesson_card.dart';
import '../../../course_detail_payment_enroll/course_detail/widgets/section_row.dart';
import '../../my_completed_course/widgets/bottom_action_ink.dart';
import 'rating_dialog.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: ListView(
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
          ),
        ),
        BottomActionInk(
          buttonString: 'Continue Course',
          action: () {
            showDialog<dynamic>(
              context: context,
              builder: (context) => const RatingDialog(),
            );
          },
        )
      ],
    );
  }
}
