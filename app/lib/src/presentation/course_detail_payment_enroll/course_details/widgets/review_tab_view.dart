import 'package:auto_route/auto_route.dart';
import 'package:ez_intl/l10n/arb/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../data/models/course_details/course_details_fetch_response_model.dart';
import '../../../../injector/injector.dart';
import '../../../home_and_action_menu/home/widgets/title_row.dart';
import '../../../home_and_action_menu/search/widgets/star_filter_chips.dart';
import '../bloc/course_details_bloc.dart';
import 'review_list_tile.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key, this.courseData}) : super(key: key);

  final Data? courseData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final rating = courseData?.rating;
    final reviewCount = courseData?.reviewCount;
    final l10n = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) =>
          getIt<CourseDetailsBloc>()..add(CourseReviewsFetched('all')),
      child: BlocConsumer<CourseDetailsBloc, CourseDetailsState>(
        listener: (context, state) {
          if (state is CourseReviewsFetchFailure)
            Utils.showAppSnackBar(context, state.error.errorMessage);
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(
              top: 8.0,
              bottom: screenHeight * 0.15,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            physics: const ClampingScrollPhysics(),
            children: (state is CourseReviewsFetchSuccess)
                ? [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_half_rounded,
                            color: Color(0xfffc9a0e),
                          ),
                          Expanded(
                            child: TitleRow(
                              title: '$rating ($reviewCount ${l10n.reviews})',
                              leadingButtonText: l10n.seeAll,
                              leadingButtonCallback: () =>
                                  context.router.pushNamed(Routes.review),
                            ),
                          ),
                        ],
                      ),
                      StarFilterChips(
                        selectedCallbackAction: (String value) {
                          context
                              .read<CourseDetailsBloc>()
                              .add(CourseReviewsFetched(value));
                        },
                      ),
                    ] +
                    List.generate(state.reviewData?.items?.length ?? 0,
                        (index) {
                      final review = state.reviewData?.items?[index];

                      return ReviewListTile(
                        fullName: review?.user?.fullName,
                        avatar: review?.user?.avatar,
                        rating: review?.rating,
                        content: review?.content,
                        likeCount: review?.likeCount,
                      );
                    })
                : [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_half_rounded,
                          color: Color(0xfffc9a0e),
                        ),
                        Expanded(
                          child: TitleRow(
                            title: '$rating ($reviewCount ${l10n.reviews})',
                            leadingButtonText: l10n.seeAll,
                            leadingButtonCallback: () =>
                                context.router.pushNamed(Routes.review),
                          ),
                        ),
                      ],
                    ),
                    StarFilterChips(
                      selectedCallbackAction: (String value) {
                        context
                            .read<CourseDetailsBloc>()
                            .add(CourseReviewsFetched(value));
                      },
                    ),
                    const LoadingWidget()
                  ],
          );
        },
      ),
    );
  }
}
