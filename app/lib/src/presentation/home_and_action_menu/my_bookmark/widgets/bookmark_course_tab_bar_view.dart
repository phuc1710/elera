import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/bookmark_bloc.dart';
import 'bookmark_course_list_view.dart';

class BookmarkCourseTabBarView extends StatefulWidget {
  const BookmarkCourseTabBarView({
    Key? key,
    required this.courseList,
  }) : super(key: key);

  final List<CourseList>? courseList;
  @override
  State<BookmarkCourseTabBarView> createState() =>
      _BookmarkCourseTabBarViewState();
}

class _BookmarkCourseTabBarViewState extends State<BookmarkCourseTabBarView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (214.0 - 4 * (widget.courseList?[0].items?.length ?? 0)) *
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
            BlocConsumer<BookmarkBloc, BookmarkState>(
              listener: (context, state) {},
              builder: (context, state) {
                return !(state is BookmarkFetchSuccess ||
                        state is BookmarkRemovalSuccess)
                    ? const Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: TabBarView(
                          children: List.generate(
                              widget.courseList?.length ?? 0, (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: BookmarkCourseListView(
                                tag: getCourseTag(state, index),
                                courseList: getCourseList(state, index),
                              ),
                            );
                          }),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  String? getCourseTag(BookmarkState state, int index) {
    if (state is BookmarkFetchSuccess) {
      return widget.courseList?[index].tag;
    }
    if (state is BookmarkRemovalSuccess) {
      return state.courseList[index].tag;
    }

    return '';
  }

  List<CourseList>? getCourseList(BookmarkState state, int index) {
    if (state is BookmarkFetchSuccess) {
      return widget.courseList;
    }
    if (state is BookmarkRemovalSuccess) {
      return state.courseList;
    }

    return [];
  }
}
