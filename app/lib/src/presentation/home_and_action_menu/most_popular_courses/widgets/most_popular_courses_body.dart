import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/course_bloc.dart';
import 'course_tab_bar_view.dart';

class MostPopularCoursesBody extends StatelessWidget {
  const MostPopularCoursesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocConsumer<CourseBloc, CourseState>(
          listener: (context, state) {
            if (state is CourseFetchFailure)
              Utils.showAppSnackBar(context, state.error.errorMessage);
          },
          buildWhen: (prev, curr) =>
              prev is CourseFetchInProgress && curr is CourseFetchSuccess,
          builder: (context, state) {
            return CourseTabBarView(courses: getCourses(context, state));
          },
        ),
      ],
    );
  }

  List<Course>? getCourses(BuildContext context, CourseState state) {
    if (state is CourseFetchSuccess) {
      return state.data?.courses;
    }

    if (state is BookmarkAdditionSuccess) {
      return state.courses;
    }

    if (state is BookmarkRemovalSuccess) {
      return state.courses;
    }

    return [];
  }
}
