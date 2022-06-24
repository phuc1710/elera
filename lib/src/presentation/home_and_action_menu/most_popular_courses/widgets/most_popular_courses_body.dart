import 'package:flutter/material.dart';

import '../../home/widgets/course_tab_bar.dart';

class MyBookmarkScaffoldBody extends StatelessWidget {
  const MyBookmarkScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CourseTabBar(),
      ],
    );
  }
}
