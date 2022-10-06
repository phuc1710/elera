import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/my_complete_course_bloc.dart';
import '../widgets/my_completed_course_body.dart';

class MyCompletedCourseView extends StatelessWidget {
  const MyCompletedCourseView({
    Key? key,
    required this.courseId,
    required this.courseTitle,
  }) : super(key: key);

  final String courseId;
  final String courseTitle;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: textTheme.headline6,
        title: Text(courseTitle),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
        leadingWidth: 35,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: screenHeight * 0.0995,
      ),
      body: BlocProvider(
        create: (context) => getIt<MyCompleteCourseBloc>()
          ..add(MyCompleteCourseFetched(courseId)),
        child: const MyCompletedCourseBody(),
      ),
    );
  }
}
