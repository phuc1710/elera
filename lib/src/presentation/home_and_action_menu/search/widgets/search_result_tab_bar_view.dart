import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../models/course/course_model.dart';
import '../../home/widgets/course_list_view.dart';
import '../../top_mentors/widgets/top_mentors_body.dart';
import 'not_found_list_view.dart';
import 'search_result_title_row.dart';

class SearchResultTabView extends StatefulWidget {
  const SearchResultTabView({
    Key? key,
    required this.searchPhrase,
  }) : super(key: key);

  final String searchPhrase;
  @override
  State<SearchResultTabView> createState() => _SearchResultTabViewState();
}

class _SearchResultTabViewState extends State<SearchResultTabView> {
  final _tabList = ['Courses', 'Mentors'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 185.0 * courseList.length + 30,
        child: DefaultTabController(
          length: _tabList.length,
          child: Column(
            children: [
              ButtonsTabBar(
                backgroundColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                borderWidth: 2,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.141,
                ),
                physics: const NeverScrollableScrollPhysics(),
                radius: 20,
                tabs: _tabList.map((e) => Tab(text: e)).toList(),
                unselectedBackgroundColor: Colors.white,
                unselectedBorderColor: Theme.of(context).primaryColor,
                unselectedLabelStyle:
                    TextStyle(color: Theme.of(context).primaryColor),
              ),
              SearchResultTitleRow(
                phrase: widget.searchPhrase,
                leadingText: '0 founds',
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    if (widget.searchPhrase.isEmpty)
                      const NotFoundListView()
                    else
                      const CourseListView(),
                    if (widget.searchPhrase.isEmpty)
                      const NotFoundListView()
                    else
                      const TopMentorsBody(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
