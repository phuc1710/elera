import 'package:flutter/material.dart';

import '../widgets/my_ongoing_course_body.dart';

class MyOngoingCourseView extends StatelessWidget {
  const MyOngoingCourseView({Key? key, required this.courseTitle})
      : super(key: key);

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
      body: const MyOngoingCourseBody(),
    );
  }
}
