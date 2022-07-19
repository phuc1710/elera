import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/home_bloc.dart';
import 'home_course_list_view.dart';

class HomeCourseTabBarView extends StatefulWidget {
  const HomeCourseTabBarView({
    Key? key,
    required this.courseList,
  }) : super(key: key);

  final List<CourseList>? courseList;
  @override
  State<HomeCourseTabBarView> createState() => _HomeCourseTabBarViewState();
}

class _HomeCourseTabBarViewState extends State<HomeCourseTabBarView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (211.0 - 5 * (widget.courseList?[0].items?.length ?? 0)) *
          (widget.courseList?[0].items?.length ?? 0),
      child: DefaultTabController(
        length: widget.courseList?.length ?? 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: ButtonsTabBar(
                backgroundColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                borderWidth: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                radius: 20,
                tabs: widget.courseList
                        ?.map((course) => Tab(text: course.tag))
                        .toList() ??
                    [],
                unselectedBackgroundColor: Colors.white,
                unselectedBorderColor: Theme.of(context).primaryColor,
                unselectedLabelStyle:
                    TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children:
                    List.generate(widget.courseList?.length ?? 0, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: HomeCourseListView(
                      tag: widget.courseList?[index].tag,
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
      return widget.courseList?[index].tag;
    }
    if (state is BookmarkAdditionSuccess) {
      return state.courseList[index].tag;
    }
    if (state is BookmarkRemovalSuccess) {
      return state.courseList[index].tag;
    }

    return '';
  }

  List<CourseList>? getCourseList(HomeState state, int index) {
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
