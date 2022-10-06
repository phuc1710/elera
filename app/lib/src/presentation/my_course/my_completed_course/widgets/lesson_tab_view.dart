import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../../../course_detail_payment_enroll/course_details/bloc/course_details_bloc.dart';
import '../../../course_detail_payment_enroll/course_details/widgets/lesson_card.dart';
import '../../../course_detail_payment_enroll/course_details/widgets/section_row.dart';
import '../bloc/my_complete_course_bloc.dart';
import 'bottom_action_ink.dart';

class LessonsTabView extends StatelessWidget {
  const LessonsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        BlocProvider(
          create: (context) =>
              getIt<CourseDetailsBloc>()..add(CourseLessonsFetched()),
          child: BlocConsumer<MyCompleteCourseBloc, MyCompleteCourseState>(
            listener: (context, state) {
              if (state is MyCompleteCourseFetchFailure)
                Utils.showAppSnackBar(context, state.error.errorMessage);
            },
            builder: (context, state) {
              if (state is MyCompleteCourseFetchSuccess) {
                final lessonData = state.courseData?.lessons?.items;
                final lesson2dList =
                    List.generate(lessonData?.length ?? 0, (index) {
                  final item = lessonData?[index];

                  return [
                    SectionRow(
                      title: '${item?.section}',
                      leadingButtonText: '${item?.time}',
                    ),
                    ...List.generate(
                      lessonData?[index].lesson?.length ?? 0,
                      (childIndex) {
                        final lesson = item?.lesson?[childIndex].item;

                        return LessonCard(
                          id: '${lesson?.lessonOrder}',
                          lessonTitle: '${lesson?.lessonName}',
                          duration: '${lesson?.time}',
                          isLock: lesson?.status == 'lock',
                          videoLink: lesson?.content,
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
        ),
        BottomActionInk(
          buttonString: 'Start Course Again',
          action: () {},
        )
      ],
    );
  }
}
