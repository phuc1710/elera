import 'package:flutter/material.dart';

import '../../home_and_action_menu/home/widgets/title_row.dart';
import '../../home_and_action_menu/search/widgets/star_filter_chips.dart';
import 'review_list_tile.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleRow(
          title: '⭐  4.8 (4,479 reviews)',
          leadingButtonText: 'See All',
          leadingButtonCallback: () {},
        ),
        const StarFilterChips(),
        const ReviewListTile(),
        const ReviewListTile(),
        const ReviewListTile(),
      ],
    );
  }
}
