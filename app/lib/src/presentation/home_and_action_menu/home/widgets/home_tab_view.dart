import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../../injector/injector.dart';
import '../bloc/home_bloc.dart';
import 'deals_slider.dart';
import 'home_course_tab_bar_view.dart';
import 'mentor_list_view.dart';
import 'search_bar.dart';
import 'title_row.dart';
import 'user_header_list_tile.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(HomeFetched()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserHeaderListTile(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Hero(
                  tag: 'searchBar',
                  child: Material(
                    color: Colors.white,
                    child: SearchBar(
                      atHome: true,
                      onFocus: () {},
                    ),
                  ),
                ),
              ),
              const DealsSlider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TitleRow(
                  title: 'Top Mentors',
                  leadingButtonText: 'See All',
                  leadingButtonCallback: () =>
                      context.router.pushNamed(Routes.topMentors),
                ),
              ),
              const MentorListView(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: TitleRow(
                  title: 'Most Popular Courses',
                  leadingButtonText: 'See All',
                  leadingButtonCallback: () =>
                      context.router.pushNamed(Routes.mostPopularCourses),
                ),
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeFetchFailure) {
                    Utils.showAppSnackBar(context, state.error.errorMessage);
                  }
                },
                buildWhen: (prev, current) =>
                    prev is HomeFetchInProgress && current is HomeFetchSuccess,
                builder: (context, state) => !(state is HomeFetchSuccess ||
                        state is BookmarkRemovalSuccess ||
                        state is BookmarkAdditionSuccess)
                    ? const Center(child: CircularProgressIndicator())
                    : HomeCourseTabBarView(
                        courseList: getCourseList(context, state),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<CourseList>? getCourseList(BuildContext context, HomeState state) {
    if (state is HomeFetchSuccess) {
      return state.data?.courseList;
    }

    if (state is BookmarkAdditionSuccess) {
      return state.courseList;
    }

    if (state is BookmarkRemovalSuccess) {
      return state.courseList;
    }

    return [];
  }
}
