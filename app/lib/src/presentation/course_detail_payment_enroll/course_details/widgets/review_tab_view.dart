import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/router/routes.dart';
import '../../../home_and_action_menu/home/widgets/title_row.dart';
import '../../../home_and_action_menu/search/widgets/star_filter_chips.dart';
import 'review_list_tile.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      padding: EdgeInsets.only(
        top: 8.0,
        bottom: screenHeight * 0.15,
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
      ),
      physics: const ClampingScrollPhysics(),
      children: [
        Row(
          children: [
            const Icon(
              Icons.star_half_rounded,
              color: Color(0xfffc9a0e),
            ),
            Expanded(
              child: TitleRow(
                title: '4.8 (4,479 reviews)',
                leadingButtonText: 'See All',
                leadingButtonCallback: () =>
                    context.router.pushNamed(Routes.review),
              ),
            ),
          ],
        ),
        const StarFilterChips(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
      ],
    );
  }
}
