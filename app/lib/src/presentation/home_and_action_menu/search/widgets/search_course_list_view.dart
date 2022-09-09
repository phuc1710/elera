import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../home/widgets/course_card.dart';
import '../bloc/search_bloc.dart';

class SearchCourseListView extends StatefulWidget {
  const SearchCourseListView({
    Key? key,
    required this.courseList,
    required this.tag,
  }) : super(key: key);

  final String? tag;
  final List<Course>? courseList;

  @override
  State<SearchCourseListView> createState() => _SearchCourseListViewState();
}

class _SearchCourseListViewState extends State<SearchCourseListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
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
        .read<SearchBloc>()
        .add(SearchBookmarkAddRequested(courseList, tag, name));
  }

  void onBookmarkRemoved(
    BuildContext context,
    List<Course> courseList,
    String tag,
    String name,
  ) {
    context
        .read<SearchBloc>()
        .add(SearchBookmarkRemoveRequested(courseList, tag, name));
  }
}
