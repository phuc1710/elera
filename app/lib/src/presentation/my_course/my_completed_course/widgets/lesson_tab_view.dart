import 'package:flutter/material.dart';

import '../../../../data/models/my_course_detail/my_course_detail_fetch_response_model.dart';
import '../../../course_detail_payment_enroll/course_details/widgets/lesson_card.dart';
import '../../../course_detail_payment_enroll/course_details/widgets/section_row.dart';
import 'bottom_action_ink.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key, this.courseId, this.lessonData})
      : super(key: key);

  final String? courseId;
  final List<ItemElement>? lessonData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final lesson2dList = List.generate(lessonData?.length ?? 0, (index) {
      final item = lessonData?[index];

      return [
        SectionRow(
          title: '${item?.section}',
          leadingButtonText: '${item?.time}',
        ),
        ...List.generate(
          lessonData?[index].lesson?.length ?? 0,
          (childIndex) {
            final lesson = item?.lesson?[childIndex].item;

            return LessonCard(
              courseId: '$courseId',
              id: '${lesson?.id}',
              order: '${lesson?.lessonOrder}',
              lessonTitle: '${lesson?.lessonName}',
              duration: '${lesson?.time}',
              isLock: lesson?.status == 'lock',
              videoLink: lesson?.content,
            );
          },
        ),
      ];
    });
    final lesson1dList = [for (var list in lesson2dList) ...list];

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          physics: const ClampingScrollPhysics(),
          children: lesson1dList,
        ),
        BottomActionInk(
          buttonString: 'Start Course Again',
          action: () {},
        )
      ],
    );
  }
}
