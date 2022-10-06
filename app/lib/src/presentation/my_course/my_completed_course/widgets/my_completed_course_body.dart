import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../bloc/my_complete_course_bloc.dart';
import 'certificate_tab_view.dart';
import 'lesson_tab_view.dart';

class MyCompletedCourseBody extends StatelessWidget {
  const MyCompletedCourseBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return BlocConsumer<MyCompleteCourseBloc, MyCompleteCourseState>(
      listener: (context, state) {
        if (state is MyCompleteCourseFetchFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is MyCompleteCourseFetchSuccess) {
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: primaryColor,
                  labelStyle: textTheme.bodyText2,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: primaryColor, width: 3),
                  ),
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [Tab(text: 'Lessons'), Tab(text: 'Certificates')],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      const LessonsTabView(),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.02),
                        child: CertificateTabView(certificateLink: state.courseData?.certificate),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const LoadingWidget();
      },
    );
  }
}
