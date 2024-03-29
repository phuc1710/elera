import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import 'mentor_course_list_view.dart';
import 'mentor_student_list_view.dart';
import 'review_tab_view.dart';

class MentorDetailTabBarView extends StatelessWidget {
  const MentorDetailTabBarView({Key? key, this.courseData}) : super(key: key);

  final List<Course>? courseData;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context);

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: primaryColor,
            labelStyle:
                textTheme.bodyText2?.copyWith(fontWeight: FontWeight.bold),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: primaryColor, width: 3),
            ),
            indicatorColor: primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            tabs: [
              Tab(text: l10n.courses),
              Tab(text: l10n.studentsCap),
              Tab(text: l10n.reviewsCap)
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                MentorCourseListView(courseList: courseData, tag: ''),
                const MentorStudentListView(),
                const ReviewsTabView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
