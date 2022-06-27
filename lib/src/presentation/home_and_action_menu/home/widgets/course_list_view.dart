import 'package:flutter/material.dart';

import '../../../../models/course/course_model.dart';
import 'course_card.dart';

class CourseListView extends StatefulWidget {
  const CourseListView({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        courseList.length,
        (index) => CourseCard(
          courseModel: courseList[index],
          isInRemoveBookmark: false,
          onRemoveBookmark: () {
            bookmarkList
                .removeWhere((item) => item.name == courseList[index].name);
            setState(() {
              courseList[index].isBookmarked = false;
            });
          },
        ),
      ),
    );
  }
}
