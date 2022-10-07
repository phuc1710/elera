import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../bloc/my_ongoing_course_bloc.dart';
import 'lesson_tab_view.dart';

class MyOngoingCourseBody extends StatelessWidget {
  const MyOngoingCourseBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOngoingCourseBloc, MyOngoingCourseState>(
      listener: (context, state) {
        if (state is MyOngoingCourseFetchFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is MyOngoingCourseFetchSuccess) {
          return LessonsTabView(lessonData: state.courseData?.lessons?.items);
        }

        return const LoadingWidget();
      },
    );
  }
}
