import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';
import '../../../my_course/my_completed_course/widgets/bottom_action_ink.dart';
import 'lesson_tab_view.dart';

class LessonBody extends StatelessWidget {
  const LessonBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        const LessonsTabView(),
        BottomActionInk(
          buttonString: r'Enroll Course - $40',
          action: () => context.router.pushNamed(Routes.enrollCourse),
        ),
      ],
    );
  }
}
