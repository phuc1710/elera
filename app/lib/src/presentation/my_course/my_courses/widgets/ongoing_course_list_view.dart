import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/app_router.dart';
import 'my_course_card.dart';

class OngoingCourseListView extends StatelessWidget {
  const OngoingCourseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: screenHeight * 0.01,
      ),
      child: ListView(
        children: List.generate(4, (index) {
          final value = Random().nextDouble();
          const courseTitle = '3D Design Illustration';

          return MyCourseCard(
            imagePath: 'assets/images/course_2.jpg',
            value: value,
            courseTitle: courseTitle,
            time: '2 hrs 25 mins',
            action: () => context.router
                .push(MyOngoingCourseRoute(courseTitle: courseTitle)),
          );
        }),
      ),
    );
  }
}
