import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../home/widgets/course_card.dart';
import '../bloc/bookmark_bloc.dart';

class BookmarkCourseListView extends StatefulWidget {
  const BookmarkCourseListView({
    Key? key,
    required this.courseList,
    required this.tag,
  }) : super(key: key);

  final String? tag;
  final List<CourseList>? courseList;

  @override
  State<BookmarkCourseListView> createState() => _BookmarkCourseListViewState();
}

class _BookmarkCourseListViewState extends State<BookmarkCourseListView> {
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
          onAddBookmark: () {},
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

  void onBookmarkRemoved(
    BuildContext context,
    List<CourseList> courseList,
    String tag,
    String name,
  ) {
    context
        .read<BookmarkBloc>()
        .add(BookmarkRemoveRequested(courseList, tag, name));
  }
}
