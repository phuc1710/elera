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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
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
      ),
    );
  }
}
