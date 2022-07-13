import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import 'course_card.dart';

class CourseListView extends StatefulWidget {
  const CourseListView({
    Key? key,
    required this.courses,
  }) : super(key: key);

  final List<Course>? courses;
  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.courses?.length ?? 0,
        (index) => CourseCard(
          courseModel: widget.courses?[index],
          isInRemoveBookmark: false,
          onRemoveBookmark: () {
            setState(() {
              widget.courses?[index].isBookmarked = false;
            });
          },
        ),
      ),
    );
  }
}
