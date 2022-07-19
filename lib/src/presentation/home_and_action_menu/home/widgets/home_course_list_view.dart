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
  final List<CourseList>? courseList;

  @override
  State<HomeCourseListView> createState() => _HomeCourseListViewState();
}

class _HomeCourseListViewState extends State<HomeCourseListView> {
  @override
  Widget build(BuildContext context) {
    final itemList = widget.courseList
        ?.firstWhere((element) => element.tag == widget.tag)
        .items;

    return Column(
      children: List.generate(
        itemList?.length ?? 0,
        (index) => CourseCard(
          courseModel: itemList?[index],
          isInRemoveBookmark: false,
          onAddBookmark: () {
            onBookmarkAdded(
              context,
              widget.courseList ?? <CourseList>[],
              '${itemList?[index].categoryName}',
              '${itemList?[index].name}',
            );
          },
          onRemoveBookmark: () {
            setState(() {
              itemList?[index].isBookmarked = false;
            });
            onBookmarkRemoved(
              context,
              widget.courseList ?? <CourseList>[],
              '${itemList?[index].categoryName}',
              '${itemList?[index].name}',
            );
          },
        ),
      ),
    );
  }

  void onBookmarkAdded(
    BuildContext context,
    List<CourseList> courseList,
    String tag,
    String name,
  ) {
    context
        .read<HomeBloc>()
        .add(HomeBookmarkAddRequested(courseList, tag, name));
  }

  void onBookmarkRemoved(
    BuildContext context,
    List<CourseList> courseList,
    String tag,
    String name,
  ) {
    context
        .read<HomeBloc>()
        .add(HomeBookmarkRemoveRequested(courseList, tag, name));
  }
}
