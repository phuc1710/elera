import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';
import '../../course_details/widgets/enroll_button.dart';
import 'lesson_tab_view.dart';

class LessonBody extends StatelessWidget {
  const LessonBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.717,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: const LessonsTabView(),
            ),
          ),
        ),
        EnrollButton(
          action: () => context.router.pushNamed(Routes.enrollCourse),
        )
      ],
    );
  }
}
