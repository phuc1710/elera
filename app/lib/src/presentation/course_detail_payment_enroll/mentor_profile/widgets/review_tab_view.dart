import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../../../home_and_action_menu/search/widgets/star_filter_chips.dart';
import '../../course_details/widgets/review_list_tile.dart';
import '../bloc/mentor_details_bloc.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => getIt<MentorDetailsBloc>()..add(MentorReviewsFetched('All')),
      child: BlocConsumer<MentorDetailsBloc, MentorDetailsState>(
        listener: (context, state) {
          if (state is MentorReviewsFetchFailure)
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
            children: (state is MentorReviewsFetchSuccess)
                ? List.generate(
                    state.mentorReviewData?.reviews?.items?.length ?? 0,
                    (index) {
                    final review =
                        state.mentorReviewData?.reviews?.items?[index];

                    return ReviewListTile(
                      fullName: review?.user?.fullName,
                      avatar: review?.user?.avatar,
                      rating: review?.rating,
                      content: review?.content,
                      likeCount: review?.likeCount,
                    );
                  })
                : [const LoadingWidget()],
          );
        },
      ),
    );
  }
}
