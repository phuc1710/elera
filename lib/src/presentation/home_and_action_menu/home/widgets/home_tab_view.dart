import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/snackbar.dart';
import '../../most_popular_courses/views/most_popular_courses_view.dart';
import '../../top_mentors/views/top_mentors_view.dart';
import '../bloc/home_bloc.dart';
import 'course_tab_bar_view.dart';
import 'deals_slider.dart';
import 'mentor_list_view.dart';
import 'search_bar.dart';
import 'title_row.dart';
import 'user_header_list_tile.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider(
        create: (context) => HomeBloc()..add(CourseFetched()),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserHeaderListTile(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: const Hero(
                  tag: 'searchBar',
                  child: Material(
                    color: Colors.white,
                    child: SearchBar(
                      atHome: true,
                    ),
                  ),
                ),
              ),
              const DealsSlider(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TitleRow(
                  title: 'Top Mentors',
                  leadingButtonText: 'See All',
                  leadingButtonCallback: () {
                    Navigator.push<Object?>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const TopMentorsView(),
                      ),
                    );
                  },
                ),
              ),
              const MentorListview(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TitleRow(
                  title: 'Most Popular Courses',
                  leadingButtonText: 'See All',
                  leadingButtonCallback: () {
                    Navigator.push<Object?>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const MostPopularCoursesView(),
                      ),
                    );
                  },
                ),
              ),
              BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeCourseFailed) {
                    AppSnackBar(
                      message: state.message ?? 'An error occurred',
                    ).show(context);
                  }
                },
                builder: (context, state) {
                  if (state is HomeCourseLoading)
                    return const Center(child: CircularProgressIndicator());
                  if (state is HomeCourseSuccess)
                    return CourseTabBarView(courseList: state.courses);

                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
