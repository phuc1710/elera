import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../home/widgets/course_card.dart';
import '../bloc/bookmark_bloc.dart';

class BookmarkCourseListView extends StatefulWidget {
  const BookmarkCourseListView({
    Key? key,
    required this.courses,
    required this.tag,
  }) : super(key: key);

  final String? tag;
  final List<Course>? courses;

  @override
  State<BookmarkCourseListView> createState() => _BookmarkCourseListViewState();
}

class _BookmarkCourseListViewState extends State<BookmarkCourseListView> {
  @override
  Widget build(BuildContext context) {
    final itemList = widget.courses
        ?.firstWhere((element) => element.categoryName == widget.tag);

    return Column(
      children: List.generate(
        widget.courses?.length ?? 0,
        (index) => CourseCard(
          courseModel: widget.courses?[index],
          isInRemoveBookmark: false,
          onAddBookmark: () {},
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

  void onBookmarkRemoved(
    BuildContext context,
    List<Course> courseList,
    String tag,
    String name,
  ) {
    context
        .read<BookmarkBloc>()
        .add(BookmarkRemoveRequested(courseList, tag, name));
  }
}
