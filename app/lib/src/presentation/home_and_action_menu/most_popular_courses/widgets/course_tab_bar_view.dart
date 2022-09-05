import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import 'course_list_view.dart';

class CourseTabBarView extends StatefulWidget {
  const CourseTabBarView({
    Key? key,
    required this.courses,
  }) : super(key: key);

  final List<Course>? courses;
  @override
  State<CourseTabBarView> createState() => _CourseTabBarViewState();
}

class _CourseTabBarViewState extends State<CourseTabBarView> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final screenWidth = MediaQuery.of(context).size.width;

    int? courseListLength;
    try {
      courseListLength = widget.courses?.length;
    } catch (_) {
      courseListLength = 0;
    }

    return SizedBox(
      height: (211.0 - 5 * (courseListLength ?? 0)) * (courseListLength ?? 0),
      child: DefaultTabController(
        length: widget.courses?.length ?? 0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: ButtonsTabBar(
                backgroundColor: primaryColor,
                borderColor: primaryColor,
                borderWidth: 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                radius: 20,
                tabs: widget.courses
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
                children: List.generate(widget.courses?.length ?? 0, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: CourseListView(
                      categoryName: widget.courses?[index].categoryName,
                      courses: widget.courses,
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
}
