import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/course/course_fetch_response_model.dart';
import '../../../../data/models/mentor/mentor_fetch_response_model.dart';
import 'not_found_list_view.dart';
import 'search_course_list_view.dart';
import 'search_result_title_row.dart';
import 'top_mentors_list_view.dart';

class SearchResultTabView extends StatefulWidget {
  const SearchResultTabView({
    Key? key,
    required this.searchPhrase,
    this.courseList,
    this.mentorList,
  }) : super(key: key);

  final String searchPhrase;
  final List<Item>? courseList;
  final List<Mentor>? mentorList;
  @override
  State<SearchResultTabView> createState() => _SearchResultTabViewState();
}

class _SearchResultTabViewState extends State<SearchResultTabView> {
  final _tabList = ['Courses', 'Mentors'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
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
                leadingText:
                    '${(widget.courseList?.length ?? 0) + (widget.mentorList?.length ?? 0)} founds',
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    if (widget.courseList?.isEmpty ?? true)
                      const NotFoundListView()
                    else
                      SearchCourseListView(
                        courseList: widget.courseList,
                        tag: '',
                      ),
                    if (widget.searchPhrase.isEmpty)
                      const NotFoundListView()
                    else
                      TopMentorsListView(
                        mentorList: widget.mentorList,
                      ),
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
