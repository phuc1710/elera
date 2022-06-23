import 'package:flutter/material.dart';

import '../../home/widgets/course_filter_chips.dart';
import '../../home/widgets/course_list_view.dart';

class MyBookmarkScaffoldBody extends StatelessWidget {
  const MyBookmarkScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CourseFilterChips(),
        CourseListView(),
      ],
    );
  }
}
