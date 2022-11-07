import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../bloc/my_course_bloc.dart';
import '../widgets/completed_course_list_view.dart';
import '../widgets/ongoing_course_list_view.dart';
import '../widgets/title_app_bar.dart';

class MyCoursesTabView extends StatelessWidget {
  const MyCoursesTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) => getIt<MyCourseBloc>()..add(MyCourseFetched()),
      child: Column(
        children: [
          TitleAppBar(title: l10n.myCourse),
          Expanded(
            child: DefaultTabController(
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
                    tabs: [Tab(text: l10n.ongoing), Tab(text: l10n.completed)],
                  ),
                  Expanded(
                    child: BlocConsumer<MyCourseBloc, MyCourseState>(
                      listener: (context, state) {
                        if (state is MyCourseFetchFailure)
                          Utils.showAppSnackBar(
                            context,
                            state.error.errorMessage,
                          );
                      },
                      buildWhen: (prev, current) =>
                          prev is MyCourseFetchInProgress &&
                          current is MyCourseFetchSuccess,
                      builder: (context, state) {
                        if (state is MyCourseFetchSuccess)
                          return TabBarView(
                            children: [
                              OngoingCourseListView(
                                courseList: state.courseData?.data
                                    ?.firstWhere(
                                      (element) =>
                                          element.status == 'processing',
                                    )
                                    .courses,
                              ),
                              CompletedCourseListView(
                                courseList: state.courseData?.data
                                    ?.firstWhere(
                                      (element) => element.status == 'complete',
                                    )
                                    .courses,
                              ),
                            ],
                          );

                        return const LoadingWidget();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
