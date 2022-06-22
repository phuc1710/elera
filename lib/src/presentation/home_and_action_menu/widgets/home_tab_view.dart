import 'package:flutter/material.dart';

import 'course_filter_chips.dart';
import 'course_list_view.dart';
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserHeaderListTile(),
            const SearchBar(),
            const DealsSlider(),
            TitleRow(
              title: 'Top Mentors',
              leadingButtonText: 'See All',
              leadingButtonCallback: () {},
            ),
            const MentorListview(),
            TitleRow(
              title: 'Most Popular Courses',
              leadingButtonText: 'See All',
              leadingButtonCallback: () {},
            ),
            const CourseFilterChips(),
            const CourseListView()
          ],
        ),
      ),
    );
  }
}
