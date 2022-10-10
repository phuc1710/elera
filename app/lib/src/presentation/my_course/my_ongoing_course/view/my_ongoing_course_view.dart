import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injector/injector.dart';
import '../bloc/my_ongoing_course_bloc.dart';
import '../widgets/my_ongoing_course_body.dart';

class MyOngoingCourseView extends StatelessWidget {
  const MyOngoingCourseView({
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
        create: (context) =>
            getIt<MyOngoingCourseBloc>()..add(MyOngoingCourseFetched(courseId)),
        child: MyOngoingCourseBody(courseId: courseId),
      ),
    );
  }
}
