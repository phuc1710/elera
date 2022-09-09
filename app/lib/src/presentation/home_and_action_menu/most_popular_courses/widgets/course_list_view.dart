import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../home/widgets/course_card.dart';
import '../bloc/course_bloc.dart';

class CourseListView extends StatefulWidget {
  const CourseListView({
    Key? key,
    required this.courses,
    required this.categoryName,
  }) : super(key: key);

  final String? categoryName;
  final List<Course>? courses;

  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  @override
  Widget build(BuildContext context) {
    final itemList = widget.courses
        ?.firstWhere((element) => element.categoryName == widget.categoryName);

    return Column(
      children: List.generate(
        widget.courses?.length ?? 0,
        (index) => CourseCard(
          courseModel: widget.courses?[index],
          isInRemoveBookmark: false,
          onAddBookmark: () {
            onBookmarkAdded(
              context,
              widget.courses ?? <Course>[],
              '${widget.courses?[index].categoryName}',
              '${widget.courses?[index].name}',
            );
          },
          onRemoveBookmark: () {
            setState(() {
              widget.courses?[index].isBookmarked = false;
            });
            onBookmarkRemoved(
              context,
              widget.courses ?? <Course>[],
              '${widget.courses?[index].categoryName}',
              '${widget.courses?[index].name}',
            );
          },
        ),
      ),
    );
  }

  void onBookmarkAdded(
    BuildContext context,
    List<Course> courseList,
    String tag,
    String name,
  ) {
    context
        .read<CourseBloc>()
        .add(CourseBookmarkAddRequested(courseList, tag, name));
  }

  void onBookmarkRemoved(
    BuildContext context,
    List<Course> courseList,
    String tag,
    String name,
  ) {
    context
        .read<CourseBloc>()
        .add(CourseBookmarkRemoveRequested(courseList, tag, name));
  }
}
