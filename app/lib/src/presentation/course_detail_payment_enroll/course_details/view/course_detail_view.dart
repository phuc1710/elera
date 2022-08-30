import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../../../my_course/my_completed_course/widgets/bottom_action_ink.dart';
import '../bloc/course_details_bloc.dart';
import '../widgets/course_detail_tab_bar_view.dart';
import '../widgets/course_extra_info.dart';
import '../widgets/course_tag_and_review.dart';
import '../widgets/course_title.dart';
import '../widgets/price_row.dart';

class CourseDetailsView extends StatefulWidget {
  const CourseDetailsView({Key? key, required this.courseId}) : super(key: key);

  final String courseId;

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  ScrollController? scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

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

              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  NestedScrollView(
                    controller: scrollController,
                    headerSliverBuilder: (context, value) => [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            AppBar(
                              flexibleSpace:
                                  Image.asset('assets/images/not_found.png'),
                              elevation: 0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    enrollCount: '${course?.enrollCount}',
                                    totalTime: '${course?.totalTime}',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.01,
                                    ),
                                    child: const Divider(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: TabBar(
                          controller: tabController,
                          labelColor: primaryColor,
                          labelStyle: textTheme.bodyText2,
                          indicator: UnderlineTabIndicator(
                            borderSide:
                                BorderSide(color: primaryColor, width: 3),
                          ),
                          indicatorColor: primaryColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const [
                            Tab(text: 'About'),
                            Tab(text: 'Lessons'),
                            Tab(text: 'Reviews')
                          ],
                        ),
                      )
                    ],
                    body: CourseDetailTabBarView(
                      controller: tabController,
                      courseData: course,
                    ),
                  ),
                  BottomActionInk(
                    buttonString: r'Enroll Course - $40',
                    action: () => context.router.pushNamed(Routes.enrollCourse),
                  ),
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
