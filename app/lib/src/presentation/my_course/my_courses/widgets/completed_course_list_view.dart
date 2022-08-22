import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';
import 'my_course_card.dart';

class CompletedCourseListView extends StatelessWidget {
  const CompletedCourseListView({Key? key}) : super(key: key);

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
        children: List.generate(5, (index) {
          const value = 1.0;
          const courseTitle = 'CRM Management for Dummies';

          return MyCourseCard(
            imagePath: 'assets/images/course_1.png',
            value: value,
            courseTitle: courseTitle,
            time: '2 hrs 25 mins',
            action: () => context.router
                .push(MyCompletedCourseRoute(courseTitle: courseTitle)),
          );
        }),
      ),
    );
  }
}
