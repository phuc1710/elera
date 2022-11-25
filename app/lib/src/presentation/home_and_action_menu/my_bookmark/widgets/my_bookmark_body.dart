import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/bookmark_bloc.dart';
import 'bookmark_course_tab_bar_view.dart';

class MyBookmarkBody extends StatelessWidget {
  const MyBookmarkBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkBloc, BookmarkState>(
      listener: (context, state) {
        if (state is BookmarkFetchFailure)
          Utils.showAppSnackBar(context, state.error.errorMessage);
      },
      buildWhen: (prev, curr) =>
          prev is BookmarkFetchInProgress && curr is BookmarkFetchSuccess,
      builder: (context, state) =>
          !(state is BookmarkFetchSuccess || state is BookmarkRemovalSuccess)
              ? const Center(child: CircularProgressIndicator())
              : const BookmarkCourseTabBarView(
                  courses: null,
                ), //getCourseList(context, state)),
    );
  }

  List<Course>? getCourseList(BuildContext context, BookmarkState state) {
    if (state is BookmarkFetchSuccess) {
      return state.data?.bookmarkCourses;
    }

    if (state is BookmarkRemovalSuccess) {
      return state.courses;
    }

    return [];
  }
}
