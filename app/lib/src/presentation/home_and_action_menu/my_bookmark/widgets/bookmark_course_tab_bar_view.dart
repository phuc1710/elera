import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../bloc/bookmark_bloc.dart';
import 'bookmark_course_list_view.dart';

class BookmarkCourseTabBarView extends StatefulWidget {
  const BookmarkCourseTabBarView({
    Key? key,
    required this.courses,
  }) : super(key: key);

  final List<Course>? courses;
  @override
  State<BookmarkCourseTabBarView> createState() =>
      _BookmarkCourseTabBarViewState();
}

class _BookmarkCourseTabBarViewState extends State<BookmarkCourseTabBarView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (214.0 - 4 * (widget.courses?.length ?? 0)) *
          (widget.courses?.length ?? 0),
      child: DefaultTabController(
        length: widget.courses?.length ?? 0,
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
                tabs: widget.courses
                        ?.map((course) => Tab(text: course.categoryName))
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
                          children: List.generate(widget.courses?.length ?? 0,
                              (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: BookmarkCourseListView(
                                tag: getCourseTag(state, index),
                                courses: getCourseList(state, index),
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
      return widget.courses?[index].categoryName;
    }
    if (state is BookmarkRemovalSuccess) {
      return state.courses[index].categoryName;
    }

    return '';
  }

  List<Course>? getCourseList(BookmarkState state, int index) {
    if (state is BookmarkFetchSuccess) {
      return widget.courses;
    }
    if (state is BookmarkRemovalSuccess) {
      return state.courses;
    }

    return [];
  }
}
