import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../bloc/mentor_details_bloc.dart';
import 'action_button_row.dart';
import 'mentor_detail_tab_bar_view.dart';
import 'mentor_extra_info.dart';
import 'mentor_info_column.dart';

class MentorProfileBody extends StatefulWidget {
  const MentorProfileBody({Key? key}) : super(key: key);

  @override
  State<MentorProfileBody> createState() => _MentorProfileBodyState();
}

class _MentorProfileBodyState extends State<MentorProfileBody>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  ScrollController? scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<MentorDetailsBloc, MentorDetailsState>(
      listener: (context, state) {
        if (state is MentorCoursesFetchFailure) {
          Utils.showAppSnackBar(context, state.error.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is MentorCoursesFetchSuccess) {
          final mentor = state.mentorCourseData?.mentor?.items;
          final courses = state.mentorCourseData?.courses?.items;

          return NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, value) => [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    MentorInfoColumn(
                      fullName: mentor?.name,
                      description: mentor?.career,
                      avatar: mentor?.avatar,
                    ),
                    const MentorExtraInfo(),
                    ActionButtonsRow(url: mentor?.website),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                        vertical: screenHeight * 0.02,
                      ),
                      child: const Divider(),
                    ),
                  ],
                ),
              )
            ],
            body: MentorDetailTabBarView(courseData: courses),
          );
        }

        return const LoadingWidget();
      },
    );
  }
}
