import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../models/course/course_model.dart';
import 'course_list_view.dart';

class CourseTabBarView extends StatefulWidget {
  const CourseTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<CourseTabBarView> createState() => _CourseTabBarViewState();
}

class _CourseTabBarViewState extends State<CourseTabBarView> {
  final List<String> _filterList = [
    '🔥 All',
    '💡 3D Design',
    '💰 Bussiness',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.0 * courseList.length,
      child: DefaultTabController(
        length: _filterList.length,
        child: Column(
          children: [
            ButtonsTabBar(
              backgroundColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              borderWidth: 2,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              radius: 20,
              tabs: _filterList.map((e) => Tab(text: e)).toList(),
              unselectedBackgroundColor: Colors.white,
              unselectedBorderColor: Theme.of(context).primaryColor,
              unselectedLabelStyle:
                  TextStyle(color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                  _filterList.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: const CourseListView(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
