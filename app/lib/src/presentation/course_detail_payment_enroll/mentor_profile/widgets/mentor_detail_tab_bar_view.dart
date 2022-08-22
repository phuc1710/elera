import 'package:flutter/material.dart';

import 'mentor_course_list_view.dart';
import 'mentor_student_list_view.dart';
import 'review_tab_view.dart';

class MentorDetailTabBarView extends StatelessWidget {
  const MentorDetailTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 700,
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
                Tab(text: 'Courses'),
                Tab(text: 'Students'),
                Tab(text: 'Reviews')
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  MentorCourseListView(courseList: [], tag: ''),
                  MentorStudentListView(),
                  ReviewsTabView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
