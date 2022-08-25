import 'package:flutter/material.dart';

import '../../../../data/models/course_details/course_details_fetch_response_model.dart';
import 'about_tab_view.dart';
import 'lesson_tab_view.dart';
import 'review_tab_view.dart';

class CourseDetailTabBarView extends StatelessWidget {
  const CourseDetailTabBarView({Key? key, this.courseData}) : super(key: key);

  final Datum? courseData;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 650,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              labelColor: primaryColor,
              labelStyle: textTheme.bodyText2,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: primaryColor, width: 3),
              ),
              indicatorColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'About'),
                Tab(text: 'Lessons'),
                Tab(text: 'Reviews')
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  AboutTabView(courseData: courseData),
                  const LessonsTabView(),
                  const ReviewsTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
