import 'package:flutter/material.dart';

import '../../../../data/models/course_details/course_details_fetch_response_model.dart';
import 'about_tab_view.dart';
import '../widgets/lesson_tab_view.dart';
import 'review_tab_view.dart';

class CourseDetailTabBarView extends StatelessWidget {
  const CourseDetailTabBarView({Key? key, this.courseData, this.controller})
      : super(key: key);

  final Data? courseData;
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: <Widget>[
        AboutTabView(courseData: courseData),
        const LessonsTabView(),
        ReviewsTabView(courseData: courseData),
      ],
    );
  }
}
