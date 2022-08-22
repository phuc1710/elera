import 'package:flutter/material.dart';

import '../widgets/completed_course_list_view.dart';
import '../widgets/ongoing_course_list_view.dart';
import '../widgets/title_app_bar.dart';

class MyCoursesTabView extends StatelessWidget {
  const MyCoursesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        const TitleAppBar(title: 'My Course'),
        Expanded(
          child: DefaultTabController(
            length: 2,
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
                  tabs: const [Tab(text: 'Ongoing'), Tab(text: 'Completed')],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      OngoingCourseListView(),
                      CompletedCourseListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
