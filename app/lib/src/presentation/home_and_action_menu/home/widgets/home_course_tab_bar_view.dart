import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/home_bloc.dart';
import 'home_course_list_view.dart';

class HomeCourseTabBarView extends StatefulWidget {
  const HomeCourseTabBarView({Key? key, required this.courseList})
      : super(key: key);

  final List<Course>? courseList;
  @override
  State<HomeCourseTabBarView> createState() => _HomeCourseTabBarViewState();
}

class _HomeCourseTabBarViewState extends State<HomeCourseTabBarView> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: (213.0 - 5 * (widget.courseList?.length ?? 0)) *
          (widget.courseList?.length ?? 0),
      child: DefaultTabController(
        length: widget.courseList?.length ?? 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                top: screenHeight * 0.01,
                bottom: screenHeight * 0.01,
              ),
              child: ButtonsTabBar(
                backgroundColor: primaryColor,
                borderColor: primaryColor,
                borderWidth: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                radius: 20,
                tabs: widget.courseList
                        ?.map((course) => Tab(text: course.categoryName))
                        .toList() ??
                    [],
                unselectedBackgroundColor: Colors.white,
                unselectedBorderColor: primaryColor,
                unselectedLabelStyle: TextStyle(color: primaryColor),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children:
                    List.generate(widget.courseList?.length ?? 0, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: HomeCourseListView(
                      tag: widget.courseList?[index].categoryName,
                      courseList: widget.courseList,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? getCourseTag(HomeState state, int index) {
    if (state is HomeFetchSuccess) {
      return widget.courseList?[index].categoryName;
    }
    if (state is BookmarkAdditionSuccess) {
      return state.courseList[index].categoryName;
    }
    if (state is BookmarkRemovalSuccess) {
      return state.courseList[index].categoryName;
    }

    return '';
  }

  List<Course>? getCourseList(HomeState state, int index) {
    if (state is HomeFetchSuccess) {
      return widget.courseList;
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
