import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/home_bloc.dart';
import 'course_card.dart';

class HomeCourseListView extends StatefulWidget {
  const HomeCourseListView({
    Key? key,
    required this.courseList,
    required this.tag,
  }) : super(key: key);

  final String? tag;
  final List<Course>? courseList;

  @override
  State<HomeCourseListView> createState() => _HomeCourseListViewState();
}

class _HomeCourseListViewState extends State<HomeCourseListView> {
  @override
  Widget build(BuildContext context) {
    final itemList = widget.courseList
        ?.firstWhere((element) => element.categoryName == widget.tag);

    return Column(
      children: List.generate(
        widget.courseList?.length ?? 0,
        (index) => CourseCard(
          courseModel: widget.courseList?[index],
          isInRemoveBookmark: false,
          onAddBookmark: () {
            onBookmarkAdded(
              context,
              widget.courseList ?? <Course>[],
              '${widget.courseList?[index].categoryName}',
              '${widget.courseList?[index].name}',
            );
          },
          onRemoveBookmark: () {
            setState(() {
              widget.courseList?[index].isBookmarked = false;
            });
            onBookmarkRemoved(
              context,
              widget.courseList ?? <Course>[],
              '${widget.courseList?[index].categoryName}',
              '${widget.courseList?[index].name}',
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
        .read<HomeBloc>()
        .add(HomeBookmarkAddRequested(courseList, tag, name));
  }

  void onBookmarkRemoved(
    BuildContext context,
    List<Course> courseList,
    String tag,
    String name,
  ) {
    context
        .read<HomeBloc>()
        .add(HomeBookmarkRemoveRequested(courseList, tag, name));
  }
}
