import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';
import '../../../../data/models/my_course/my_course_fetch_response_model.dart';
import 'my_course_card.dart';

class OngoingCourseListView extends StatelessWidget {
  const OngoingCourseListView({Key? key, this.courseList}) : super(key: key);

  final List<Course>? courseList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.01,
      ),
      child: ListView(
        children: List.generate(courseList?.length ?? 0, (index) {
          final courseInfo = courseList?[index].courseInfo;
          final courseId = courseList?[index].courseId;
          final completedLesson = courseInfo?.completeLesson ?? 0;
          final lessonCount = courseInfo?.lessonCount ?? 1;

          return MyCourseCard(
            imagePath: 'assets/images/course_2.jpg',
            value: completedLesson / lessonCount,
            courseTitle: '${courseInfo?.name}',
            time: '${courseInfo?.totalTime}',
            action: () => context.router.push(
              MyOngoingCourseRoute(
                courseId: '$courseId',
                courseTitle: '${courseInfo?.name}',
              ),
            ),
          );
        }),
      ),
    );
  }
}
