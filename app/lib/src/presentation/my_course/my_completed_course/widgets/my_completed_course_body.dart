import 'package:flutter/material.dart';

import 'lesson_tab_view.dart';
import 'certificate_tab_view.dart';

class MyCompletedCourseBody extends StatelessWidget {
  const MyCompletedCourseBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return DefaultTabController(
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
            tabs: const [Tab(text: 'Lessons'), Tab(text: 'Certificates')],
          ),
          Expanded(
            child: TabBarView(
              children: [
                const LessonsTabView(),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                  child: const CertificateTabView(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
