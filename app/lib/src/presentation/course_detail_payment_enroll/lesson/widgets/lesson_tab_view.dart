import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../../../home_and_action_menu/home/widgets/title_row.dart';
import '../../course_details/bloc/course_details_bloc.dart';
import '../../course_details/widgets/lesson_card.dart';
import '../../course_details/widgets/section_row.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) =>
          getIt<CourseDetailsBloc>()..add(CourseLessonsFetched()),
      child: BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
        listener: (context, state) {
          if (state is CourseLessonsFetchFailure)
            Utils.showAppSnackBar(context, state.error.errorMessage);
        },
        builder: (context, state) {
          if (state is CourseLessonsFetchSuccess) {
            final lessonData = state.lessonData?.items;
            final lesson2dList =
                List.generate(lessonData?.length ?? 0, (index) {
              final item = lessonData?[index];

              return [
                SectionRow(
                  title: '${item?.section}',
                  leadingButtonText: '${item?.time}',
                ),
                ...List.generate(
                  state.lessonData?.items?[index].lesson?.length ?? 0,
                  (childIndex) {
                    final lesson = item?.lesson?[childIndex];

                    return LessonCard(
                      id: '${lesson?.order}',
                      lessonTitle: '${lesson?.name}',
                      duration: '${lesson?.time}',
                      isLock: lesson?.status == 'lock',
                    );
                  },
                ),
              ];
            });
            final lesson1dList = [for (var list in lesson2dList) ...list];

            return ListView(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: screenHeight * 0.15,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              physics: const ClampingScrollPhysics(),
              children: lesson1dList,
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
