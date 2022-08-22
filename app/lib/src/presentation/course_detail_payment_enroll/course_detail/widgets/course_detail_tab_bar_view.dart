import 'package:flutter/material.dart';

import 'about_tab_view.dart';
import 'lesson_tab_view.dart';
import 'review_tab_view.dart';

class CourseDetailTabBarView extends StatelessWidget {
  const CourseDetailTabBarView({
    Key? key,
  }) : super(key: key);

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
            const Expanded(
              child: TabBarView(
                children: <Widget>[
                  AboutTabView(),
                  LessonsTabView(),
                  ReviewsTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
