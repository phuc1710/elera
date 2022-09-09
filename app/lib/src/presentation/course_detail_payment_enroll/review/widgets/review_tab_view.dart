import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/utils.dart';
import '../../../../injector/injector.dart';
import '../../../home_and_action_menu/search/widgets/star_filter_chips.dart';
import '../../course_details/widgets/review_list_tile.dart';
import '../bloc/review_bloc.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => getIt<ReviewBloc>()..add(ReviewFetched('all')),
      child: BlocConsumer<ReviewBloc, ReviewState>(
        listener: (context, state) {
          if (state is ReviewFetchFailure)
            Utils.showAppSnackBar(context, state.error.errorMessage);
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(
              bottom: screenHeight * 0.15,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
            ),
            physics: const ClampingScrollPhysics(),
            children: (state is ReviewFetchSuccess)
                ? <Widget>[
                      StarFilterChips(
                        selectedCallbackAction: (String value) {
                          context.read<ReviewBloc>().add(ReviewFetched(value));
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
                    StarFilterChips(
                      selectedCallbackAction: (String value) {
                        context.read<ReviewBloc>().add(ReviewFetched(value));
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
