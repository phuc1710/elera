import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../bloc/bloc/course_details_bloc.dart';
import '../widgets/course_detail_tab_bar_view.dart';
import '../widgets/course_extra_info.dart';
import '../widgets/course_tag_and_review.dart';
import '../widgets/course_title.dart';
import '../widgets/enroll_button.dart';
import '../widgets/price_row.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({Key? key, required this.courseId}) : super(key: key);

  final String courseId;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<CourseDetailsBloc>()..add(CourseDetailsFetched()),
        child: BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
          listener: (context, state) {
            if (state is CourseDetailsFetchFailure) {
              Utils.showAppSnackBar(context, state.error.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is CourseDetailsFetchSuccess) {
              final course = state.courseData;

              return Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.85,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppBar(
                            flexibleSpace:
                                Image.asset('assets/images/not_found.png'),
                            elevation: 0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CourseTitle(title: '${course?.name}'),
                                CourseTagAndReview(
                                  tag: '${course?.categoryName}',
                                  rating: '${course?.rating}',
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                  ),
                                  child: PriceRow(
                                    price: r'$'
                                        '${course?.discountPrice?.en}',
                                    originalPrice: r'$'
                                        '${course?.originalPrice?.en}',
                                  ),
                                ),
                                CourseExtraInfo(
                                  enrollCount:
                                      '${course?.enrollCount}',
                                  totalTime: '${course?.totalTime}',
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                  ),
                                  child: const Divider(),
                                ),
                                CourseDetailTabBarView(courseData: course)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  EnrollButton(
                    action: () => context.router.pushNamed(Routes.enrollCourse),
                  )
                ],
              );
            }

            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
